local Class = require 'lib.class'
local Tile = require 'src.terrain.tile'

local Forest = Class{ __includes = Tile }

function Forest:init(x, y)
  Tile.init(self, "Forest", x, y)
end

function Forest:getMovementModifier()
end

function Forest:getAttackModifier()
end

function Forest:getDefenseModifier()
end

return Forest
