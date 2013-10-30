local Class = require 'lib.class'
local Entity = require 'src.entities.entity'
local COMBAT_DEFAULTS = require 'combat'

local Helicopter = Class{ __includes = Entity }

function Helicopter:init(x, y, side)
  Entity.init(self, "Helicopter", x, y, side)
  -- init control 
  self.flags = { 
    left = false,
    right = false, 
    up = false, 
    down = false
  }
  self.image_name = "heli.png"
  -- init data 
  self.is_dead = false
  self.is_moved = false
  self.attack_value = 15
  self.attack_range = COMBAT_DEFAULTS.HELICOPTER.ATTACKING.ATTACK_RANGE
  self.id = COMBAT_DEFAULTS.HELICOPTER.ID
  self.hp = COMBAT_DEFAULTS.HELICOPTER.HP
  self.attack_amp = COMBAT_DEFAULTS.HELICOPTER.ATTACKING
  self.defend_amp = COMBAT_DEFAULTS.HELICOPTER.DEFENDING
end

function Helicopter:update(dt)
end

--function Helicopter:draw()
--end

function Helicopter:keypressed(key, code)
end

function Helicopter:keyreleased(key, code)
end

function Helicopter:mousepressed(x, y, button)
    -- flag on when the mouse click on the object 
    if button == 'l' then 
      self.flags.left = true 
    elseif button == 'r' then 
      self.flags.right = true
    end
end

function Helicopter:mousereleased(x, y, button)
    -- flag off when button released
    if button == 'l' then 
      self.flags.left = false
    elseif button == 'r' then 
      self.flags.right = false
    end 
end

return Helicopter
