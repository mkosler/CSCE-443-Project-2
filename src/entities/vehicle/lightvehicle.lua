local Class = require 'lib.class'
local Entity = require 'src.entities.entity'

local LightVehicle = Class{ __includes = Entity }

function LightVehicle:init(x, y)
  Entity.init(self, "LightVehicle", x, y)
end

function LightVehicle:update(dt)
end

function LightVehicle:draw()
end

function LightVehicle:keypressed(key, code)
end

function LightVehicle:keyreleased(key, code)
end

function LightVehicle:mousepressed(x, y, button)
end

function LightVehicle:mousereleased(x, y, button)
end

return LightVehicle

