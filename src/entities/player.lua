------------------------------------------------------------------------
-- Requires ------------------------------------------------------------
------------------------------------------------------------------------
local Class = require 'lib.class'

local Helicopter = require 'src.entities.helicopter'
local LightVehicle = require 'src.entities.vehicle.lightvehicle'
local HeavyVehicle = require 'src.entities.vehicle.heavyvehicle'
local LightInfantry = require 'src.entities.infantry.lightvehicle'
local HeavyInfantry = require 'src.entities.infantry.heavyinfantry'

local Player = Class{}

------------------------------------------------------------------------
-- Functions -----------------------------------------------------------
------------------------------------------------------------------------

function Player:init()
  local num_units = 11
  self.player = {}
end 
  
return Player
