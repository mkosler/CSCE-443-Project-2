-- rules for each type of terrain 
-- MOVE (addition)
-- ATTACK AND DEFEND (multiplier)
return {
  PLAIN = {
    ATTACK = 1,
	  DEFEND = 1,
	  MOVE = 0,
	  PASSIBLE = true,
  },
  FOREST = {
    ATTACK = 1,
	  DEFEND = 2,
	  MOVE = -1,
	  PASSIBLE = true,
  },
  MOUNTAIN = {
    ATTACK = 1,
	  DEFEND = 1,
	  MOVE = 0,
	  PASSIBLE = false,
  },
  AMPLIFIER = {
    IMG = {
      big_thick         = 'Ampilfier_big_thick.png', 
      big               = 'Ampilfier_big.png',
      small_thicker     = 'Ampilfier_small_thick.png',
      small             = 'Ampilfier_small.png',
    },
    ATTACK = 2,
	  DEFEND = .5,
	  MOVE = 0,
    PASSIBLE = true,
  },
  BATTERY = {
    IMG = {
      big_thick         = 'Battery_big_thicker.png',
      big               = 'Battery_big.png',
      small_thicker     = 'Battery_small_thick.png',
      small             = 'Battery_small.png'
    },
    ATTACK = 1,
    DEFEND = 1,
    MOVE = 0,
    PASSIBLE = true,
  },
  GROUND = {
    IMG = {
      big_thick         = 'Ground_big_thick.png',
      big               = 'Ground_big.png',
      small_thicker     = 'Ground_small_thicker.png',
      small             = 'Ground_small.png',
    },
    ATTACK = 1,
    DEFEND = 1,
    MOVE = 0,
    PASSIBLE = true,
  },
  RESISTOR = {
    IMG = {
      big_thick         = 'Resistor_big_thick.png',
      big               = 'Resistor_big.png',
      small_thicker     = 'Resistor_small_thicker.png',
      small             = 'Resistor_small.png',
    },
    ATTACK = 1,
    DEFEND = 1,
    MOVE = 0,
    PASSIBLE = true,
  },
}