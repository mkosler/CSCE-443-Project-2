local Class = require 'lib.class'
local Entity = require 'src.entities.entity'

local HeavyVehicle = Class{ __includes = Entity }

function HeavyVehicle:init(x, y)
  Entity.init(self, "HeavyVehicle", x, y)
end

function HeavyVehicle:update(dt)
end

function HeavyVehicle:draw()
end

function HeavyVehicle:keypressed(key, code)
end

function HeavyVehicle:keyreleased(key, code)
end

function HeavyVehicle:mousepressed(x, y, button)
end

function HeavyVehicle:mousereleased(x, y, button)
end

return HeavyVehicle

