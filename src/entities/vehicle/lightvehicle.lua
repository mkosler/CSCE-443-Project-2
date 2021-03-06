------------------------------------------------------------------------
-- Requires ------------------------------------------------------------
------------------------------------------------------------------------
local Class = require 'lib.class'
local Entity = require 'src.entities.entity'
local COMBAT_DEFAULTS = require 'combat'

local LightVehicle = Class{ __includes = Entity }

------------------------------------------------------------------------
-- Functions -----------------------------------------------------------
------------------------------------------------------------------------

function LightVehicle:init(x, y, side)
  local self_name = "LIGHT_VEHICLE"
  Entity.init(self, self_name, x, y, side)
  -- init data ---------------------------------
    self.image_name = "LV.png"
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

function LightVehicle:update(dt)
end

function LightVehicle:draw()
end

function LightVehicle:keypressed(key, code)
end

function LightVehicle:keyreleased(key, code)
end

function LightVehicle:mousepressed(x, y, button)
end

function LightVehicle:mousereleased(x, y, button)
end

return LightVehicle

