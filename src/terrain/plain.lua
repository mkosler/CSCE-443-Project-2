------------------------------------------------------------------------
-- Requires ------------------------------------------------------------
------------------------------------------------------------------------

local Class = require 'lib.class'
local Tile = require 'src.terrain.tile'
local TERRAIN = require 'terrain'

------------------------------------------------------------------------
-- Functions -----------------------------------------------------------
------------------------------------------------------------------------

local Plain = Class{ __includes = Tile }

--- Constructor
-- @param x X-coordinate of the tile
-- @param y Y-coordinate of the tile
-- @param row Row of the tile
-- @param column Column of the tile
function Plain:init(x, y)
  Tile.init(self, "PLAIN", x, y)
  local name = "PLAIN"
  
  self.attack_mod      = TERRAIN[name].ATTACK
  self.defend_mod      = TERRAIN[name].DEFEND
  self.move_mod        = TERRAIN[name].MOVE
  self.is_passible = TERRAIN[name].PASSIBLE
  
end

--- Get the movement speed modifier of the tile
-- @return The movement speed modifier of the tile
function Plain:getMovementModifier()
end

--- Get the attack bonus modifier of the tile
--@return The attack bonus modifier of the tile
function Plain:getAttackModifier()
end

--- Get the defense bonus modifier of the tile
--@return The defense bonus modifier of the tile
function Plain:getDefenseModifier()
end

return Plain
