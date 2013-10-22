local Class = require 'lib.class'
local Entity = require 'src.entities.entity'

local HeavyVehicle = Class{ __includes = Entity }

function HeavyVehicle:init(x, y, side)
  Entity.init(self, "HeavyVehicle", x, y, side)
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
  self.id = COMBAT_DEFAULTS.HEAVY_VEHICLE.ID
  self.hp = COMBAT_DEFAULTS.HEAVY_VEHICLE.HP
  self.attack_amp = COMBAT_DEFAULTS.HEAVY_VEHICLE.ATTACKING
  self.defend_amp = COMBAT_DEFAULTS.HEAVY_VEHICLE.DEFENDING  
end

function HeavyVehicle:update(dt)
end

function HeavyVehicle:draw()
end

function HeavyVehicle:keypressed(key, code)
end

function HeavyVehicle:keyreleased(key, code)
end

function HeavyVehicle:mousepressed(x, y, button)
end

function HeavyVehicle:mousereleased(x, y, button)
end

return HeavyVehicle

