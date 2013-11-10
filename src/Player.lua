------------------------------------------------------------------------
-- Requires ------------------------------------------------------------
------------------------------------------------------------------------
local Class = require 'lib.class'

-- local Helicopter = require 'src.entities.helicopter'
-- local LightVehicle = require 'src.entities.vehicle.lightvehicle'
-- local HeavyVehicle = require 'src.entities.vehicle.heavyvehicle'
-- local LightInfantry = require 'src.entities.infantry.lightvehicle'
-- local HeavyInfantry = require 'src.entities.infantry.heavyinfantry'

local unit_lib = { 
 Helicopter = require 'src.entities.helicopter',
 LightVehicle = require 'src.entities.vehicle.lightvehicle',
 HeavyVehicle = require 'src.entities.vehicle.heavyvehicle',
 LightInfantry = require 'src.entities.infantry.lightvehicle',
 HeavyInfantry = require 'src.entities.infantry.heavyinfantry',
 Commander = require 'src.entities.commander'
}

local COMBAT_DEFAULTS = require 'combat'

local Player = Class{}

------------------------------------------------------------------------
-- Functions -----------------------------------------------------------
------------------------------------------------------------------------

function Player:init(player_id)
  -- Resource to manage the selection of the units
  self.resource = COMBAT_DEFAULTS.PLAYER_RESOURCE
  self.units = {}
  -- Player ID
  self.id = player_id
end 

function Player:add_unit(unit_name, x, y)
    unit_lib[unit_name](x, y, self.id)
    table.insert(self.units, unit)
end

function Player:remove_unit(id)
    -- body
end

return Player
