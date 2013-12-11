local Class = require 'lib.class'
local Server = require "src.Network.Server"
local Client = require "src.Network.Client"
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

function EXIT_PROGRAM:init( )
    event.init( self, "EXIT_PROGRAM" )
    --setmetatable( self, EXIT_PROGRAM )
end

function EXIT_PROGRAM:act( State, dt )
    love.event.quit()
    return {}
end

events.EXIT_PROGRAM = EXIT_PROGRAM

local START_LOCAL_SERVER = Class{ __includes = event }

function START_LOCAL_SERVER:init( )
    event.init( self, "START_LOCAL_SERVER" )
end

function START_LOCAL_SERVER:act( State, dt )
    State.network = Server()
    loveframes.SetState("waiting")
    return {}
end

events.START_LOCAL_SERVER = START_LOCAL_SERVER

local CONNECT_TO_SERVER = Class{ __includes = event }

function CONNECT_TO_SERVER:init( )
    event.init( self, "CONNECT_TO_SERVER" )
end

function CONNECT_TO_SERVER:act( State, dt )
    State.network = Client("127.0.0.1")
    Gamestate.switch(Battle, true, State.network)
    return {}
end

events.CONNECT_TO_SERVER = CONNECT_TO_SERVER

local CANCEL = Class{ __includes = event }

function CANCEL:init()
    event.init(self,"CANCEL")
end

function CANCEL:act(State, dt )
    State.network = nil
    return {}
end

events.CANCEL = CANCEL

return events