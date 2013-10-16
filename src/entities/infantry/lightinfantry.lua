local Class = require 'lib.class'
local Entity = require 'src.entities.entity'

local LightInfantry = Class{ __includes = Entity }

function LightInfantry:init(x, y)
  Entity.init(self, "LightInfantry", x, y)
end

function LightInfantry:update(dt)
end

function LightInfantry:draw()
end

function LightInfantry:keypressed(key, code)
end

function LightInfantry:keyreleased(key, code)
end

function LightInfantry:mousepressed(x, y, button)
end

function LightInfantry:mousereleased(x, y, button)
end

return LightInfantry
