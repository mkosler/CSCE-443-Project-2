------------------------------------------------------------------------
-- Requires ------------------------------------------------------------
------------------------------------------------------------------------
local Class = require 'lib.class'
local Entity = require 'src.entities.entity'
local COMBAT_DEFAULTS = require 'combat'

local HeavyInfantry = Class{ __includes = Entity }

------------------------------------------------------------------------
-- Functions -----------------------------------------------------------
------------------------------------------------------------------------

function HeavyInfantry:init(x, y, side)
  Entity.init(self, "HeavyInfantry", x, y, side)
  -- init data ---------------------------------
  self.is_dead = false
  self.is_moved = false
  self.attack_value = 15

  -- init default values -----------------------
  self.hp = COMBAT_DEFAULTS.HEAVY_INFANTRY.HP
  self.move = COMBAT_DEFAULTS.HEAVY_INFANTRY.MOVE
  self.attack_range = COMBAT_DEFAULTS.HEAVY_INFANTRY.ATTACKING.ATTACK_RANGE
  self.attack_amp = COMBAT_DEFAULTS.HEAVY_INFANTRY.ATTACKING
  self.defend_amp = COMBAT_DEFAULTS.HEAVY_INFANTRY.DEFENDING
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
