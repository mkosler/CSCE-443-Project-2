------------------------------------------------------------------------
-- Requires ------------------------------------------------------------
------------------------------------------------------------------------

local Class = require 'lib.class'
local Tile = require 'src.terrain.tile'
local TERRAIN = require 'terrain'

------------------------------------------------------------------------
-- Functions -----------------------------------------------------------
------------------------------------------------------------------------

local Resistor = Class{ __includes = Tile }

--- Constructor
-- @param x X-coordinate of the tile
-- @param y Y-coordinate of the tile
-- @param row Row of the tile
-- @param column Column of the tile
function Resistor:init(x, y)
  Tile.init(self, "Resistor", x, y)
  local name = "RESISTOR"

  self.img         = TERRAIN[name].IMG.big_thick
  self.attack      = TERRAIN[name].ATTACK
  self.defend      = TERRAIN[name].DEFEND
  self.move        = TERRAIN[name].MOVE
  self.is_passible = TERRAIN[name].PASSIBLE
  
end

--- Get the movement speed modifier of the tile
-- @return The movement speed modifier of the tile
function Resistor:getMovementModifier()
end

--- Get the attack bonus modifier of the tile
--@return The attack bonus modifier of the tile
function Resistor:getAttackModifier()
end

--- Get the defense bonus modifier of the tile
--@return The defense bonus modifier of the tile
function Resistor:getDefenseModifier()
end

return Resistor
