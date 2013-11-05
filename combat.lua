--- The combat rules for each unit
return {
  LIGHT_INFANTRY = {
    -- img = love.graphics.newImage("art/1.png") 
    HP = 100,
    MOVE = 6,
    ATTACKING = {
      ATTACK_RANGE   = 1,
      LIGHT_INFANTRY = 1,
      HEAVY_INFANTRY = 2,
      LIGHT_VEHICLE  = 1,
      HEAVY_VEHICLE  = 0.5,
      HELICOPTER     = 1,
      COMMANDER      = 1,
    },
    DEFENDING = {
      LIGHT_INFANTRY = 1,
      HEAVY_INFANTRY = 1,
      LIGHT_VEHICLE  = 1,
      HEAVY_VEHICLE  = 1,
      HELICOPTER     = 2,
      COMMANDER      = 0,
    },
  },
  HEAVY_INFANTRY = {
    -- img = love.graphics.newImage("art/2.png") 
    HP = 100,
    MOVE = 4,
    ATTACKING = {
      ATTACK_RANGE   = 1,
      LIGHT_INFANTRY = 1,
      HEAVY_INFANTRY = 1,
      LIGHT_VEHICLE  = 2,
      HEAVY_VEHICLE  = 1,
      HELICOPTER     = 0.5,
      COMMANDER      = 1,
    },
    DEFENDING = {
      LIGHT_INFANTRY = 0.5,
      HEAVY_INFANTRY = 1,
      LIGHT_VEHICLE  = 1,
      HEAVY_VEHICLE  = 1,
      HELICOPTER     = 1,
      COMMANDER      = 0,
    },
  },
  LIGHT_VEHICLE = {
    -- img = love.graphics.newImage("art/3.png") 
    HP = 100,
    MOVE = 6,
    ATTACKING = {
      ATTACK_RANGE   = 1,
      LIGHT_INFANTRY = 1,
      HEAVY_INFANTRY = 1,
      LIGHT_VEHICLE  = 1,
      HEAVY_VEHICLE  = 0.5,
      HELICOPTER     = 2,
      COMMANDER      = 1,
    },
    DEFENDING = {
      LIGHT_INFANTRY = 1,
      HEAVY_INFANTRY = 0.5,
      LIGHT_VEHICLE  = 1,
      HEAVY_VEHICLE  = 0.5,
      HELICOPTER     = 2,
      COMMANDER      = 0,
    },
  },
  HEAVY_VEHICLE = {
    -- img = love.graphics.newImage("art/4.png") 
    HP = 100,
    MOVE = 4,
    ATTACKING = {
      ATTACK_RANGE   = 1,
      LIGHT_INFANTRY = 1,
      HEAVY_INFANTRY = 1,
      LIGHT_VEHICLE  = 2,
      HEAVY_VEHICLE  = 1,
      HELICOPTER     = 0.5,
      COMMANDER      = 1,
    },
    DEFENDING = {
      LIGHT_INFANTRY = 2,
      HEAVY_INFANTRY = 1,
      LIGHT_VEHICLE  = 2,
      HEAVY_VEHICLE  = 1,
      HELICOPTER     = 0.5,
      COMMANDER      = 0,
    },
  },
  HELICOPTER = {
    -- img = love.graphics.newImage("art/5.png") 
    HP = 100,
    MOVE = 6,
    ATTACKING = {
      ATTACK_RANGE   = 1,
      LIGHT_INFANTRY = 0.5,
      HEAVY_INFANTRY = 1,
      LIGHT_VEHICLE  = 0.5,
      HEAVY_VEHICLE  = 2,
      HELICOPTER     = 1,
      COMMANDER      = 1,
    },
    DEFENDING = {
      LIGHT_INFANTRY = 1,
      HEAVY_INFANTRY = 2,
      LIGHT_VEHICLE  = 0.5,
      HEAVY_VEHICLE  = 2,
      HELICOPTER     = 1,
      COMMANDER      = 0,
    },
  },
  COMMANDER = {
    -- img = love.graphics.newImage("art/6.png") 
    HP = 100,
    MOVE = 1,
    ATTACKING = {
      ATTACK_RANGE   = 0,
      LIGHT_INFANTRY = 0,
      HEAVY_INFANTRY = 0,
      LIGHT_VEHICLE  = 0,
      HEAVY_VEHICLE  = 0,
      HELICOPTER     = 0,
      COMMANDER      = 0,
    },
    DEFENDING = {
      LIGHT_INFANTRY = 1,
      HEAVY_INFANTRY = 1,
      LIGHT_VEHICLE  = 1,
      HEAVY_VEHICLE  = 1,
      HELICOPTER     = 1,
      COMMANDER      = 0,
    },
  },
}
