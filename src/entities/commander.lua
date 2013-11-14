------------------------------------------------------------------------
-- Requires ------------------------------------------------------------
------------------------------------------------------------------------
local Class = require 'lib.class'
local Entity = require 'src.entities.entity'
local COMBAT_DEFAULTS = require 'combat'

local Commander = Class{ __includes = Entity }

------------------------------------------------------------------------
-- Functions -----------------------------------------------------------
------------------------------------------------------------------------

function Commander:init(x, y, side)
  Entity.init(self, "Commander", x, y, side)
    -- init data ---------------------------------
  self.is_dead = false
  self.is_moved = false
  self.attack_value = 15

  -- init default values -----------------------
  self.hp = COMBAT_DEFAULTS.COMMANDER.HP
  self.move = COMBAT_DEFAULTS.COMMANDER.MOVE
  self.attack_range = COMBAT_DEFAULTS.COMMANDER.ATTACKING.ATTACK_RANGE
  self.attack_amp = COMBAT_DEFAULTS.COMMANDER.ATTACKING
  self.defend_amp = COMBAT_DEFAULTS.COMMANDER.DEFENDING
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

