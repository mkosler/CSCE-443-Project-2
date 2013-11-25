------------------------------------------------------------------------
-- Requires ------------------------------------------------------------
------------------------------------------------------------------------

local Class = require 'lib.class'
local Tile = require 'src.terrain.tile'
local TERRAIN = require 'terrain'

------------------------------------------------------------------------
-- Functions -----------------------------------------------------------
------------------------------------------------------------------------

local Amplifier = Class{ __includes = Tile }

--- Constructor
-- @param x X-coordinate of the tile
-- @param y Y-coordinate of the tile
-- @param row Row of the tile
-- @param column Column of the tile
function Amplifier:init(x, y)
  Tile.init(self, "Amplifier", x, y)
  local name = "AMPLIFIER"
  
  self.img         = TERRAIN[name].IMG
  self.attack      = TERRAIN[name].ATTACK
  self.defend      = TERRAIN[name].DEFEND
  self.move        = TERRAIN[name].MOVE
  self.is_passible = TERRAIN[name].PASSIBLE

end

--- Get the movement speed modifier of the tile
-- @return The movement speed modifier of the tile
function Amplifier:getMovementModifier()
end

--- Get the attack bonus modifier of the tile
--@return The attack bonus modifier of the tile
function Amplifier:getAttackModifier()
end

--- Get the defense bonus modifier of the tile
--@return The defense bonus modifier of the tile
function Amplifier:getDefenseModifier()
end

return Amplifier
