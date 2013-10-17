local Class = require 'lib.class'
local Tile = require 'src.terrain.tile'

local Plain = Class{ __includes = Tile }

function Plain:init(x, y)
  Tile.init(self, "Plain", x, y)
end

function Plain:getMovementModifier()
end

function Plain:getAttackModifier()
end

function Plain:getDefenseModifier()
end

return Plain
