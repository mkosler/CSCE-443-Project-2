------------------------------------------------------------------------
-- Requires ------------------------------------------------------------
------------------------------------------------------------------------
local Class = require 'lib.class'
local Entity = require 'src.entities.entity'
local COMBAT_DEFAULTS = require 'combat'

local HeavyVehicle = Class{ __includes = Entity }

------------------------------------------------------------------------
-- Functions -----------------------------------------------------------
------------------------------------------------------------------------

function HeavyVehicle:init(x, y, side)
  local self_name = "HEAVY_VEHICLE"
  Entity.init(self, self_name, x, y, side)
  self.image_name = "HV.png"
  -- init data ---------------------------------
  self.is_dead = false
  self.is_moved = false
  self.attack_value = 15

  -- init default values -----------------------
  self.description = COMBAT_DEFAULTS[self_name].des
  self.cost = COMBAT_DEFAULTS[self_name].COST
  self.hp = COMBAT_DEFAULTS[self_name].HP
  self.move = COMBAT_DEFAULTS[self_name].MOVE
  self.attack_range = COMBAT_DEFAULTS[self_name].ATTACKING.ATTACK_RANGE
  self.attack_amp = COMBAT_DEFAULTS[self_name].ATTACKING
  self.defend_amp = COMBAT_DEFAULTS[self_name].DEFENDING
end

function HeavyVehicle:update(dt)
end

--function HeavyVehicle:draw()
--end

function HeavyVehicle:keypressed(key, code)
end

function HeavyVehicle:keyreleased(key, code)
end

function HeavyVehicle:mousepressed(x, y, button)
end

function HeavyVehicle:mousereleased(x, y, button)
end

return HeavyVehicle

