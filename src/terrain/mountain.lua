local Class = require 'lib.class'
local Tile = require 'src.terrain.tile'

local Mountain = Class{ __includes = Tile }

function Mountain:init(x, y)
  Tile.init(self, "Mountain", x, y)
end

function Mountain:getMovementModifier()
end

function Mountain:getAttackModifier()
end

function Mountain:getDefenseModifier()
end

return Mountain
