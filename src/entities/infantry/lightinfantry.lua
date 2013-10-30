local Class = require 'lib.class'
local Entity = require 'src.entities.entity'

local LightInfantry = Class{ __includes = Entity }

function LightInfantry:init(x, y, side)
  Entity.init(self, "LightInfantry", x, y, side)
  -- init control 
  self.flags = { 
    left = false,
    right = false, 
    up = false, 
    down = false
  }
  
  self.image_name = "troop.png"
  -- init data  
  self.is_dead = false
  self.is_moved = false
  self.attack_value = 15
  self.attack_range = COMBAT_DEFAULTS.LIGHT_INFANTRY.ATTACKING.ATTACK_RANGE
  self.id = COMBAT_DEFAULTS.LIGHT_INFANTRY.ID
  self.hp = COMBAT_DEFAULTS.LIGHT_INFANTRY.HP
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
