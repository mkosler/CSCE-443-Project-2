local Class = require 'lib.class'
local Entity = require 'src.entities.entity'

local Helicopter = Class{ __includes = Entity }

function Helicopter:init(x, y, side)
  Entity.init(self, "Helicopter", x, y, side)
  self.flags = { 
    left = false,
    right = false 
  }
end

function Helicopter:update(dt)
end

function Helicopter:draw()
end

function Helicopter:keypressed(key, code)
end

function Helicopter:keyreleased(key, code)
end

function Helicopter:mousepressed(x, y, button)
    -- flag on when the mouse click on the object 
    if button == 'l' 
        then self.flags.left = true 
    elseif button == 'r'
        then self.flags.right = true
    end
end

function Helicopter:mousereleased(x, y, button)
    -- flag off when button released
    if button == 'l'
        then self.flags.left = false
    elseif button == 'r'
        then self.flags.right = false
    end 
end

return Helicopter
