local Class = require 'lib.class'
local Entity = require 'src.entities.entity'

local Helicopter = Class{ __includes = Entity }

function Helicopter:init(x, y)
  Entity.init(self, "Helicopter", x, y)
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
end

function Helicopter:mousereleased(x, y, button)
end

return Helicopter
