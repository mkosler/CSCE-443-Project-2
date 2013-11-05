------------------------------------------------------------------------
-- Requires ------------------------------------------------------------
------------------------------------------------------------------------
local Class = require 'lib.class'
local Entity = require 'src.entities.entity'
local COMBAT_DEFAULTS = require 'combat'

local Helicopter = Class{ __includes = Entity }

------------------------------------------------------------------------
-- Functions -----------------------------------------------------------
------------------------------------------------------------------------

function Helicopter:init(x, y, side)
  Entity.init(self, "Helicopter", x, y, side)
  -- init data ---------------------------------
  self.is_dead = false
  self.is_moved = false
  self.attack_value = 15

  -- init default values -----------------------
  self.hp = COMBAT_DEFAULTS.HELICOPTER.HP
  self.move = COMBAT_DEFAULTS.HELICOPTER.MOVE
  self.attack_range = COMBAT_DEFAULTS.HELICOPTER.ATTACKING.ATTACK_RANGE
  self.attack_amp = COMBAT_DEFAULTS.HELICOPTER.ATTACKING
  self.defend_amp = COMBAT_DEFAULTS.HELICOPTER.DEFENDING
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
