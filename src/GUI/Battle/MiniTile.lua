local Class = require 'lib.class'
local Tile = require "src.terrain.tile"
local BATTLE_GUI_EVENTS = require(  "src.GUI.Battle.events" )

------------------------------------------------------------------------
-- Functions -----------------------------------------------------------
------------------------------------------------------------------------

local MiniTile = Class{}

MiniTile.width = 9
MiniTile.height = 9
MiniTile.clicked = nil
MiniTile.skin_name = "terrain"

function MiniTile.init( self, tile )
    self.tile = tile
end

function MiniTile:draw( object )
    local g = love.graphics
	local skin = object:GetSkin()
	local x = object:GetX()
	local y = object:GetY()
	local enabled = object:GetEnabled()
	local clickable = object:GetClickable()
    local body_color = skin.controls.button_body_color
    local connection_color = skin.controls.connection_color
    local qwidth = MiniTile.width/3
    local qheight = MiniTile.height/3
    local sub_unit = self.tile.sub_unit
    local terrain_color = self.tile.mini_terrain_color
    
    g.setColor( skin.controls.black )
    g.rectangle("fill", x, y, MiniTile.width, MiniTile.height )
    
    local no_connections = true
    for i = 0, Tile.num_connections-1, 1 do
        local exists = self.tile.connections[i]
        if exists then
            no_connections = false
            g.setColor( skin.controls.green )
        else
            g.setColor( skin.controls.black )
        end
        local rotation = Tile.connection_interval*i
        local x1 = x + MiniTile.width/2*( math.cos(rotation) + 1 )
        local y1 = y + MiniTile.height/2*( - math.sin(rotation) + 1 )
        g.line(x+MiniTile.width/2, y + MiniTile.height/2, x1, y1 )
    end
    
    if sub_unit ~= nil then
        g.setColor( skin.get_team_color( sub_unit.side ) )
    else
        if no_connections then
            g.setColor( skin.controls.black )
        else
            g.setColor( skin.controls.green )
        end
    end
    g.rectangle("fill", x+2, y+2, MiniTile.width-4, MiniTile.height-4 )
    
    
    if terrain_color ~= nil then
        g.setColor( terrain_color )
    else
        g.setColor( skin.controls.black )
    end
    for xi = 0, 2, 2 do
        for yi = 0, 2, 2 do
            --g.rectangle("fill", x+qwidth*xi, y+qheight*yi, qwidth, qheight )
        end
    end
end

function MiniTile.add_new_button( grid, mini_tile )
    local button = create_text_button( nil, nil, nil, nil, nil, MiniTile.skin_name )
    button.sub_object = mini_tile
    button.OnClick["l"] = MiniTile.cb
    grid:AddItem(button, mini_tile.tile.y+1, mini_tile.tile.x+1 )
end

return MiniTile
    
    
    