local Class = require 'lib.class'
local Entity = require 'src.entities.entity'

local Commander = Class{ __includes = Entity }

function Commander:init(x, y)
  Entity.init(self, "Commander", x, y)
end

function Commander:update(dt)
end

function Commander:draw()
end

function Commander:keypressed(key, code)
end

function Commander:keyreleased(key, code)
end

function Commander:mousepressed(x, y, button)
end

function Commander:mousereleased(x, y, button)
end

return Commander

