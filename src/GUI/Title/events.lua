local Class = require 'lib.class'
local event = require( "src.GUI.General.event" )
local events = {}

local START_LOCAL_BATTLE = Class{ __includes = event }

function START_LOCAL_BATTLE:init( )
    event.init( self, "START_LOCAL_BATTLE" )
    --setmetatable( self, START_LOCAL_BATTLE )
end

function START_LOCAL_BATTLE:act( State, dt )
    Gamestate.switch(Battle, true)
    return {}
end

events.START_LOCAL_BATTLE = START_LOCAL_BATTLE

local EXIT_PROGRAM = Class{ __includes = event }

function EXIT_PROGRAM:init( name )
    event.init( self, "EXIT_PROGRAM" )
    --setmetatable( self, EXIT_PROGRAM )
end

function EXIT_PROGRAM:act( State, dt )
    love.event.quit()
    return {}
end

events.EXIT_PROGRAM = EXIT_PROGRAM

return events