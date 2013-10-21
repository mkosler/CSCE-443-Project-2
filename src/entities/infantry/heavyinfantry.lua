local Class = require 'lib.class'
local Entity = require 'src.entities.entity'

local HeavyInfantry = Class{ __includes = Entity }

function HeavyInfantry:init(x, y, side)
  Entity.init(self, "HeavyInfantry", x, y, side)
end

function HeavyInfantry:update(dt)
end

function HeavyInfantry:draw()
end

function HeavyInfantry:keypressed(key, code)
end

function HeavyInfantry:keyreleased(key, code)
end

function HeavyInfantry:mousepressed(x, y, button)
end

function HeavyInfantry:mousereleased(x, y, button)
end

return HeavyInfantry
