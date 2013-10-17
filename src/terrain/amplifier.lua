local Class = require 'lib.class'
local Tile = require 'src.terrain.tile'

local Amplifier = Class{ __includes = Tile }

function Amplifier:init(x, y)
  Tile.init(self, "Amplifier", x, y)
end

function Amplifier:getMovementModifier()
end

function Amplifier:getAttackModifier()
end

function Amplifier:getDefenseModifier()
end

return Amplifier
