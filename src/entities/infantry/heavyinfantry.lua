local Class = require 'lib.class'
local Entity = require 'src.entities.entity'

local HeavyInfantry = Class{ __includes = Entity }

function HeavyInfantry:init(x, y, side)
  Entity.init(self, "HeavyInfantry", x, y, side)
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
  self.id = COMBAT_DEFAULTS.HEAVY_INFANTRY.ID
  self.hp = COMBAT_DEFAULTS.HEAVY_INFANTRY.HP
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
