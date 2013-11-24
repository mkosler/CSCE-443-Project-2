--- The combat rules for each unit
return {
  PLAYER_RESOURCE = 100,
  LIGHT_INFANTRY = {
    des = "Light Infantries are the first line of defense, espeically trained to take down Heavy Infantry. Also, the agility of Light Infantry is effective in retailation with Helicopter. Note: Insufficient weapon to penerate the armor of Heavy Vehicle."
    img = "light_infantry.png", 
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
    des = "Heavy Infantry is armed to against Light Vehicle in combat, but attacking are poorly against Helicopter. On defense, Heavy Infantry are weak against Light Infantry. "
    img = "heavy_infantry.png",
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
    des = "Light Vehicle perform badly when attacking Heavy Vehicle, but strongly against Helicopter. In retaliation, Light Vehicle are powerful to Helicopter, but are feeble to Heavy Infantry and Heavy Vehicle. "
    img = "light_vehicle.png",
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
    des = "Heavy Vehicle are the classic tank, strengthen to attack Light Vehicle. They are designated to destroy Light Vehicle. However, they are badly against Helicopter. In defense, Heavy Vehicle performs well in contact with Light Infantry and Light Vehicle, but can only contribute slightly in retaliation with Helicopter. "
    img = "heavy_vehicle.png",
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
    des = "The anti-ground war machine, Helicopter, is the killer of Heavy Vehicle. In return, it causes less damage to Light Infantry and Light Vehicle. When defending, Helicopter retaliate with double-damage against Heavy Infantry and Heavy Vehicle. Helicopter can only perform minimum when counterattack to Light Vehicle. "
    img = "helicopter.png", 
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
    des = "Commander are the highest and the most important unit overall. They are represent as a player’s victory or defeated. When they attack, the defender are not able to retaliate Commander. "
    img = nil,--"commander.png" 
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
