return {
  LIGHT_INFANTRY = {
    MOVE = 6,
    ATTACKING = {
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
    MOVE = 4,
    ATTACKING = {
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
    MOVE = 6,
    ATTACKING = {
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
    MOVE = 4,
    ATTACKING = {
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
    MOVE = 6,
    ATTACKING = {
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
    MOVE = 1,
    ATTACKING = {
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
