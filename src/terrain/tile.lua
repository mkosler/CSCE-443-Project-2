local Class = require 'lib.class'

local Tile = Class{}

function Tile:init(name, x, y)
  self.name = name
  self.x = x
  self.y = y
end

function Tile:draw()
end

function Tile:__tostring()
  return self.name
end

return Tile
