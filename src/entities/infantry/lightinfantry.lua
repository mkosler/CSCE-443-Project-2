------------------------------------------------------------------------
-- Requires ------------------------------------------------------------
------------------------------------------------------------------------
local Class = require 'lib.class'
local Entity = require 'src.entities.entity'
local COMBAT_DEFAULTS = require 'combat'

local LightInfantry = Class{ __includes = Entity }

------------------------------------------------------------------------
-- Functions -----------------------------------------------------------
------------------------------------------------------------------------

function LightInfantry:init(x, y, side)
  Entity.init(self, "LightInfantry", x, y, side)
  -- init data ---------------------------------
    self.image_name = "troop.png"
  self.is_dead = false
  self.is_moved = false
  self.attack_value = 15

  -- init default values -----------------------
  self.hp = COMBAT_DEFAULTS.LIGHT_INFANTRY.HP
  self.move = COMBAT_DEFAULTS.LIGHT_INFANTRY.MOVE
  self.attack_range = COMBAT_DEFAULTS.LIGHT_INFANTRY.ATTACKING.ATTACK_RANGE
  self.attack_amp = COMBAT_DEFAULTS.LIGHT_INFANTRY.ATTACKING
  self.defend_amp = COMBAT_DEFAULTS.LIGHT_INFANTRY.DEFENDING
end

function LightInfantry:update(dt)
end

--function LightInfantry:draw()
--end

function LightInfantry:keypressed(key, code)
end

function LightInfantry:keyreleased(key, code)
end

function LightInfantry:mousepressed(x, y, button)
end

function LightInfantry:mousereleased(x, y, button)
end

return LightInfantry
