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
    ATTACK = 2,
	DEFEND = .5,
	MOVE = 0,
    PASSIBLE = true,
  },
}