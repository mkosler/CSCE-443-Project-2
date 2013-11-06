local BattleMap = require( "src.BattleMap")
local Tile = require "src.terrain.tile"
local MiniTile = require "src.GUI.Battle.MiniTile"

local BattleGUI = {}

function BattleGUI.quit( object, x, y )
    object.cb_state._quit = true
end

function BattleGUI.end_turn( object, x, y )
    object.cb_state._end_turn = true
end

BattleGUI.game_buttons = { "End Turn", "Quit" }
BattleGUI.game_button_callbacks = { BattleGUI.end_turn, BattleGUI.quit }

BattleGUI.skin_name = "default"
BattleGUI.skin = loveframes.skins.Get("default")
BattleGUI.terrain_skin_name = "terrain"
BattleGUI.team_skin_name = "teamui"
BattleGUI.default_tile_size = 100
BattleGUI.font = love.graphics.newFont("assets/GUI/Fonts/Terminus.ttf", 40 )

local function update_tile_panel( object, dt )
    local mouse_x = love.mouse.getX()
    local mouse_y = love.mouse.getY()
    local s_width = conf.screen.width
    local s_height = conf.screen.height - object.ui_height
    local multi = BattleGUI.default_tile_size*3
    
    if mouse_x > s_width - 10 and object.x > -object.width+s_width then
        object:SetX( object.x-multi*dt )
    elseif mouse_x < 10 and object.x <= 0 then
        object:SetX( object.x+multi*dt )
    end
    if mouse_y > s_height + object.ui_height - 10 and object.y > -object.height+s_height-75 then
        object:SetY( object.y-multi*dt )
    elseif  mouse_y < 10 and object.y <= 0 then
        object:SetY( object.y+multi*dt )
    end
end

function BattleGUI.createBattleGUI( Battle_State )
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
    
    local description_panel = BattleGUI.create_description( Battle_State.map )
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
            tile_button.OnClick = BattleMap.selected
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

function BattleGUI.create_description( map )
    local px_width = conf.screen.width - MiniTile.width*map.width - 120
    local px_height = MiniTile.height*map.height + 20
    local panel = create_panel( px_width, px_height, BattleGUI.team_skin_name )
    return panel
end
    
function BattleGUI.create_game_buttons( Battle_State, width )
    local buttons = {}
    for i, button_text in ipairs(BattleGUI.game_buttons) do
        local button = create_text_button( button_text, nil, nil, nil, nil, BattleGUI.team_skin_name )
        button.OnClick = BattleGUI.game_button_callbacks[i]
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

return BattleGUI