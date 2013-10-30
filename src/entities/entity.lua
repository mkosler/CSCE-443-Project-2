local Class = require 'lib.class'

local Entity = Class{}

local nextID = 0

function Entity:init(name, x, y, side)
  self.name = name

  self.x = x
  self.y = y

  self.side = side

  self.id = self.side .. self.name .. nextID

  nextID = nextID + 1
end

function Entity:draw(object)
    local skin = object:GetSkin()
	local x = object:GetX()
	local y = object:GetY()
	local width = object:GetWidth()
	local height = object:GetHeight()
	local hover = object:GetHover()
    
	local down = object.down
	local enabled = object:GetEnabled()
	local clickable = object:GetClickable()
    
    if self.image_name ~= nil then
        local image = skin.images[ self.image_name ]
        local sx = width/image:getWidth() * math.pow( -1, self.side )
        local sy = height/image:getHeight()
        if self.side == 0 then
            love.graphics.setColor(0, 255, 255, 255)
        elseif self.side == 1 then
            love.graphics.setColor(255, 0, 0, 255)
        else
            love.graphics.setColor(255, 255, 255, 255)
        end
        love.graphics.draw(image, x, y, 0, sx, sy, 0, 0 )
    else
        local text = self.name
        local font = skin.controls.button_text_font
        local twidth = font:getWidth(text)
        local theight = font:getHeight(text)
        local text_color = skin.controls.button_text_color
        love.graphics.setFont(font)
        love.graphics.setColor(text_color)
        love.graphics.print(text, x + width/2 - twidth/2, y + height/2 - theight/2)
    end
end

function Entity:__tostring()
  return self.name
end

return Entity
