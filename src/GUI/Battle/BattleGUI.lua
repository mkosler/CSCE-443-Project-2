local BattleMap = require( "src.BattleMap")
local Tile = require "src.terrain.tile"
local MiniTile = require "src.GUI.Battle.MiniTile"
local BATTLE_GUI_EVENTS = require(  "src.GUI.Battle.events" )

local BattleGUI = {}

function BattleGUI.quit( object, x, y )
    BattleGUI.event_queue:push( BATTLE_GUI_EVENTS.EXIT_BATTLE_MAP() )
end

function BattleGUI.end_turn( object, x, y )
    BattleGUI.event_queue:push( BATTLE_GUI_EVENTS.END_TURN() )
end

BattleGUI.game_buttons = { "End Turn", "Quit" }
BattleGUI.game_button_callbacks = { BattleGUI.end_turn, BattleGUI.quit }

BattleGUI.skin_name = "default"
BattleGUI.skin = loveframes.skins.Get("default")
BattleGUI.terrain_skin_name = "terrain"
BattleGUI.team_skin_name = "teamui"
BattleGUI.default_tile_size = 50
BattleGUI.font = love.graphics.newFont("assets/GUI/Fonts/Terminus.ttf", 40 )

function MiniTile.cb(object, x, y)
    local mini_tile = object.sub_object
    local tile = mini_tile.tile
    local camera_x = -(tile.x+.5)*BattleGUI.default_tile_size+conf.screen.width/2
    local camera_y = -(tile.y+.5)*BattleGUI.default_tile_size+conf.screen.height/2
    BattleGUI.event_queue:push( BATTLE_GUI_EVENTS.MOVE_CAMERA( camera_x, camera_y ) )
end

local function update_tile_panel( object, dt )
    local mouse_x = love.mouse.getX()
    local mouse_y = love.mouse.getY()
    local s_width = conf.screen.width
    local s_height = conf.screen.height - object.ui_height
    local multi = BattleGUI.default_tile_size*3
    
    if mouse_x > s_width - 10 and object.x > -object.width+s_width then
        BattleGUI.camera_x = BattleGUI.camera_x-multi*dt
    elseif mouse_x < 10 and object.x <= 0 then
        BattleGUI.camera_x = BattleGUI.camera_x+multi*dt
    end
    if mouse_y > s_height + object.ui_height - 10 and object.y > -object.height+s_height-75 then
        BattleGUI.camera_y = BattleGUI.camera_y-multi*dt
    elseif  mouse_y < 10 and object.y <= 0 then
        BattleGUI.camera_y = BattleGUI.camera_y+multi*dt
    end
    
    if BattleGUI.camera_x ~= object.x then
        object:SetX( BattleGUI.camera_x )
    end
    if BattleGUI.camera_y ~= object.y then
        object:SetY( BattleGUI.camera_y )
    end
end

function BattleGUI.update( State, dt )
    State.map.turn = State.turn
    new_events = BattleGUI.event_queue:poll()
    if State.network ~= nil then
        State.network:update( BATTLE_GUI_EVENTS, State, new_events, dt )
        State.network:send_queue( new_events, State.turn )
    end
    --print( str_dict( new_events, 0 ) )
    while #new_events > 0 do
        event = table.remove( new_events, 1 )
        print( event.name )
        dispatched_events = event:act( State, dt )
        for _, dispatch_event in pairs( dispatched_events ) do
            table.insert( new_events, 1, dispatch_event )
        end
    end
end

function BattleGUI.createBattleGUI( Battle_State )
    BattleGUI.camera_x = 0
    BattleGUI.camera_y = 0
    BattleGUI.event_queue = require( "src.GUI.General.event_queue" )
    local master = create_panel( conf.screen.width, conf.screen.height, BattleGUI.skin_name )
    master:SetPos( 0 , 0 )
    master:SetState("Battle")
    Battle_State.master = master
    
    BattleGUI.createBattleGame( Battle_State )
end

function BattleGUI.createBattleGame( Battle_State )
    local map = Battle_State.map
    local units = Battle_State.units
    local game_master = create_panel( conf.screen.width, conf.screen.height, BattleGUI.skin_name )
    game_master:SetParent( Battle_State.master )
    game_master:SetPos( 0, 0 )
    
    local tile_panel = BattleGUI.create_tiles( map, units )
    tile_panel:SetParent( game_master )
    tile_panel:SetPos( 0, 0 )
    tile_panel.Update = update_tile_panel
    
    local mini_map_panel = BattleGUI.create_mini_map( map )
    mini_map_panel:SetParent( game_master )
    mini_map_panel:SetPos( game_master:GetWidth() - mini_map_panel:GetWidth(),  game_master:GetHeight() - mini_map_panel:GetHeight() )
    
    local game_button_panel = BattleGUI.create_buttons( Battle_State, Battle_State.map )
    game_button_panel:SetParent( game_master )
    game_button_panel:SetPos( 0,  game_master:GetHeight() - mini_map_panel:GetHeight() ) 
    
    local description_panel = BattleGUI.create_description( Battle_State, Battle_State.map )
    description_panel:SetParent( game_master )
    description_panel:SetPos( 100,  game_master:GetHeight() - mini_map_panel:GetHeight() ) 
    
    tile_panel.ui_height = mini_map_panel:GetHeight()
    
    Battle_State.game_master = game_master
end

function BattleGUI.create_tiles( map, units )
    local panel = create_panel( BattleGUI.default_tile_size*map.width, BattleGUI.default_tile_size*map.height, BattleGUI.terrain_skin_name )
    local grid = create_grid( 0, 0, map.width, map.height, BattleGUI.default_tile_size, BattleGUI.default_tile_size, BattleGUI.terrain_skin_name )
    grid:SetParent( panel )
    grid:SetCellPadding(0)
    grid:SetItemAutoSize(true)
    for x = 0, map.width-1, 1 do
        for y = 0, map.height-1, 1 do
            local tile_button = BattleGUI.create_tile( map.tiles[x][y] )
            tile_button.OnClick["l"] = BattleGUI.left_click_tile
            tile_button.OnClick["r"] = BattleGUI.right_click_tile
            grid:AddItem(tile_button, y+1, x+1 )
        end
    end
    BattleGUI.create_units(map, units)
    return panel
end

function BattleGUI.create_tile( tile )
    local button = create_text_button( button_text, nil, nil, nil, nil, BattleGUI.terrain_skin_name )
    button.sub_object = tile
    return button
end

function BattleGUI.create_units( map, units )
    for i, unit in ipairs( units ) do
        BattleGUI.create_unit( map.tiles[unit.x][unit.y], unit )
    end
end

function BattleGUI.create_unit( tile, unit )
    tile.sub_unit = unit
end

function BattleGUI.create_mini_map( map )
    local mini_map_px_width = MiniTile.width*map.width
    local mini_map_px_height = MiniTile.height*map.height
    local panel = create_panel( mini_map_px_width+20, mini_map_px_height+20, BattleGUI.team_skin_name )
    local grid = create_grid( 0, 0, map.width, map.height, MiniTile.width, MiniTile.height, BattleGUI.team_skin_name )
    grid:SetParent( panel )
    grid:SetCellPadding(0)
    grid:SetItemAutoSize(true)
    grid:SetPos(10, 10)
    for x = 0, map.width-1, 1 do
        for y = 0, map.height-1, 1 do
            tile = map.tiles[x][y]
            local mini_tile = MiniTile( tile )
            MiniTile.add_new_button( grid, mini_tile )
        end
    end
    return panel
end

function BattleGUI.create_description( Battle_State, map )
    local px_width = conf.screen.width - MiniTile.width*map.width - 120
    local px_height = MiniTile.height*map.height + 20
    local panel = create_panel( px_width, px_height, BattleGUI.team_skin_name )
    local description = create_text( "", nil, nil, nil, nil, BattleGUI.team_skin_name )
    description:SetParent(panel)
    description:SetWidth( px_width-20)
    description:SetHeight( px_height-20)
    description:SetPos( 10, 10 )
    Battle_State.description = description
    return panel
end
    
function BattleGUI.create_game_buttons( Battle_State, width )
    local buttons = {}
    for i, button_text in ipairs(BattleGUI.game_buttons) do
        local button = create_text_button( button_text, nil, nil, nil, nil, BattleGUI.team_skin_name )
        button.OnClick["l"] = BattleGUI.game_button_callbacks[i]
        button.cb_state = Battle_State
        button:SetWidth( width )
        button:SetHeight( 50 )
        --button:SetFont( TitleGUI.font )
        table.insert( buttons, button )
    end
    return buttons
end

function BattleGUI.create_buttons(Battle_State, map)
    local panel = create_panel( 100, MiniTile.height*map.height+20, BattleGUI.team_skin_name )
    local button_list = create_button_list( BattleGUI.create_game_buttons( Battle_State, panel:GetWidth() ), BattleGUI.skin_name )
    button_list:SetParent( panel )
    button_list:SetWidth( panel:GetWidth() )
    button_list:Center()
    return panel
end

function BattleGUI.left_click_tile( object, x, y )
    BattleGUI.event_queue:push( BATTLE_GUI_EVENTS.SELECT_TILE( object.sub_object ) ) 
end

function BattleGUI.right_click_tile( object, x, y )
    BattleGUI.event_queue:push( BATTLE_GUI_EVENTS.INTERACT_WITH( BATTLE_GUI_EVENTS.SELECT_TILE.selected_tile, object.sub_object ) ) 
end

return BattleGUI