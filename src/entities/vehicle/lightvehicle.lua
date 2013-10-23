local Class = require 'lib.class'
local Entity = require 'src.entities.entity'

local LightVehicle = Class{ __includes = Entity }

function LightVehicle:init(x, y, side)
  Entity.init(self, "LightVehicle", x, y, side)
  -- init control 
  self.flags = { 
    left = false,
    right = false, 
    up = false, 
    down = false
  }
  -- init data 
  self.is_dead = false
  self.is_moved = false
  self.attack_value = 15
  self.attack_range = COMBAT_DEFAULTS.LIGHT_VEHICLE.ATTACKING.ATTACK_RANGE
  self.id = COMBAT_DEFAULTS.LIGHT_VEHICLE.ID
  self.hp = COMBAT_DEFAULTS.LIGHT_VEHICLE.HP
  self.attack_amp = COMBAT_DEFAULTS.LIGHT_VEHICLE.ATTACKING
  self.defend_amp = COMBAT_DEFAULTS.LIGHT_VEHICLE.DEFENDING
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

