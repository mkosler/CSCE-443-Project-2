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

function Entity:__tostring()
  return self.name
end

return Entity
