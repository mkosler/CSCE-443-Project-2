------------------------------------------------------------------------
-- Requires ------------------------------------------------------------
------------------------------------------------------------------------
local Class = require 'lib.class'

------------------------------------------------------------------------
-- Functions -----------------------------------------------------------
------------------------------------------------------------------------

local Tile = Class{}

Tile.connection_interval = math.pi/2
Tile.num_connections = 2*math.pi/Tile.connection_interval
--- Constructor
-- This is the base class for all tiles; it will normally not be instantiated
-- directly
-- @param name Name of the tile
-- @param x X-coordinate of the tile
-- @param y Y-coordinate of the tile
-- @param row Row of the tile in the tilemap
-- @param column Column of the tile in the tilemap
function Tile.init(self, name, x, y)
  self.name = name
  self.x = x
  self.y = y
  self.selected = false
  self.movement = false
  self.attack = false
  self.connections = {}
  for i = 0, Tile.num_connections-1, 1 do
    self.connections[i] = false
  end
  
  self.connections = {}
end

--- Draw the tile
function Tile:draw(object)
    local g = love.graphics
	local skin = object:GetSkin()
	local x = object:GetX()
	local y = object:GetY()
	local width = object:GetWidth()
	local height = object:GetHeight()
	local hover = object:GetHover()
	--local text = object:GetText()
	--local font = skin.controls.button_text_font
	--local twidth = font:getWidth(object.text)
	--local theight = font:getHeight(object.text)
	local down = object.down
	local enabled = object:GetEnabled()
	local clickable = object:GetClickable()
    local body_color = skin.controls.button_body_color
    local outline_color = skin.controls.button_outline
    local connection_color = skin.controls.connection_color
    local sub_unit = self.sub_unit
    
    if self.selected then
        outline_color = skin.controls.button_outline_selected
    end
    
    if self.attack then
        body_color = skin.controls.button_body_attack
    elseif self.movement then
        body_color = skin.controls.button_body_movement
    end
	
    love.graphics.setColor( body_color )
    g.rectangle("fill", object:GetX(), object:GetY(), object:GetWidth(), object:GetHeight())

    love.graphics.setColor(outline_color)
    skin.OutlinedRectangle(x, y, width, height)
    
    local text = self.name
    local font = skin.controls.button_text_font
    local twidth = font:getWidth(text)
    local theight = font:getHeight(text)
    local text_color = skin.controls.button_text_color
    love.graphics.setFont(font)
    love.graphics.setColor(text_color)
    love.graphics.print(text, x + width/2 - twidth/2, y + height/2 - theight/2)
    
    love.graphics.setColor(connection_color)
    for i = 0, Tile.num_connections-1, 1 do
        local exists = self.connections[i]
        if exists then
            local rotation = Tile.connection_interval*i
            local x1 = x + width/2
            local y1 = y + height/2
            local x2 = (width/2)*math.cos(rotation)+x1
            local y2 = -(height/2)*math.sin(rotation)+y1
            love.graphics.line( x1, y1, x2, y2 )
        end
    end
    
    if sub_unit ~= nil then
        sub_unit:draw(object)
    end
end

function Tile:__tostring()
  return self.name
end

return Tile
