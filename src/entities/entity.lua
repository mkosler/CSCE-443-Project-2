local Class = require 'lib.class'

local Entity = Class{}

function Entity:init(name, x, y)
  self.name = name

  self.x = x
  self.y = y
end

function Entity:__tostring()
  return self.name
end

return Entity
