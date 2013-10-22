------------------------------------------------------------------------
-- Requires ------------------------------------------------------------
------------------------------------------------------------------------

local Class = require 'lib.class'

------------------------------------------------------------------------
-- Functions -----------------------------------------------------------
------------------------------------------------------------------------

local Tile = Class{}

--- Constructor
-- This is the base class for all tiles; it will normally not be instantiated
-- directly
-- @param name Name of the tile
-- @param x X-coordinate of the tile
-- @param y Y-coordinate of the tile
-- @param row Row of the tile in the tilemap
-- @param column Column of the tile in the tilemap
function Tile:init(name, x, y, row, column)
  self.name = name
  self.x = x
  self.y = y
  self.row = row
  self.column = column
end

--- Draw the tile
function Tile:draw()
end

function Tile:__tostring()
  return self.name
end

return Tile
