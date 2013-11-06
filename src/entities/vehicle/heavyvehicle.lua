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
  Entity.init(self, "HeavyVehicle", x, y, side)
  self.image_name = "ht.png"
  -- init data ---------------------------------
  self.is_dead = false
  self.is_moved = false
  self.attack_value = 15

  -- init default values -----------------------
  self.hp = COMBAT_DEFAULTS.HEAVY_VEHICLE.HP
  self.move = COMBAT_DEFAULTS.HEAVY_VEHICLE.MOVE
  self.attack_range = COMBAT_DEFAULTS.HEAVY_VEHICLE.ATTACKING.ATTACK_RANGE
  self.attack_amp = COMBAT_DEFAULTS.HEAVY_VEHICLE.ATTACKING
  self.defend_amp = COMBAT_DEFAULTS.HEAVY_VEHICLE.DEFENDING
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

