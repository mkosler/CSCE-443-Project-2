local BattleMap = require( "src.BattleMap")
local Tile = require "src.terrain.tile"

local BattleGUI = {}

BattleGUI.skin_name = "default"
BattleGUI.skin = loveframes.skins.Get("default")
BattleGUI.terrain_skin_name = "terrain"
BattleGUI.unit_skin_name = "unit"
BattleGUI.default_tile_size = 50
BattleGUI.font = love.graphics.newFont("assets/GUI/Fonts/Terminus.ttf", 40 )

function BattleGUI.createBattleGUI( Battle_State )
    local master = create_panel( conf.screen.width, conf.screen.height, BattleGUI.skin_name )
    master:SetPos( 0 , 0 )
    master:SetState("Battle")
    Battle_State.master = master
    
    BattleGUI.createBattleGame( Battle_State )
end

function BattleGUI.createBattleGame( Battle_State )
    local map = Battle_State.map
    local game_master = create_panel( BattleGUI.default_tile_size*map.width, BattleGUI.default_tile_size*map.height, BattleGUI.skin_name )
    game_master:SetParent( Battle_State.master )
    game_master:SetPos( 0, 0 )
    
    local tile_panel = BattleGUI.create_tiles( map )
    tile_panel:SetParent( game_master )
    tile_panel:SetPos( 0, 0 )
    
    --local unit_panel = BattleGUI.create_units( map )
    --unit_panel:SetParent( game_master )
    --tile_panel:SetPos( 0, 0 )
    
    Battle_State.game_master = game_master
end

function BattleGUI.create_tiles( map )
    local panel = create_panel( BattleGUI.default_tile_size*map.width, BattleGUI.default_tile_size*map.height, BattleGUI.terrain_skin_name )
    local grid = create_grid( 0, 0, map.width, map.height, BattleGUI.default_tile_size, BattleGUI.default_tile_size, BattleGUI.terrain_skin_name )
    grid:SetParent( panel )
    grid:SetCellPadding(0)
    grid:SetItemAutoSize(true)
    for x = 0, map.width, 1 do
        for y = 0, map.height, 1 do
            local tile_button = BattleGUI.create_tile( map.tiles[x][y] )
            tile_button.OnClick = BattleMap.selected
            grid:AddItem(tile_button, y+1, x+1 )
        end
    end
    return panel
end

function BattleGUI.create_tile( tile )
    local button = create_text_button( button_text, nil, nil, nil, nil, BattleGUI.terrain_skin_name )
    button.sub_object = tile
    return button
end

return BattleGUI