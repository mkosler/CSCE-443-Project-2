--local lube = require "lib.LUBE.LUBE"
local Class = require "lib.class"
require "src.Network.util"
require "lib.json"

local event = require( "src.GUI.General.event" )

local SERVER_TIMEOUT = Class{ __includes = event }

local CONNECTED = Class{ __includes = event }
function CONNECTED:init()
    event.init(self,"CONNECTED")
end

function CONNECTED:act( State, dt )
    Gamestate.switch(Battle, true, State.network)
    return {}
end

function SERVER_TIMEOUT:init( )
    event.init( self, "SERVER_TIMEOUT" )
end

function SERVER_TIMEOUT:act( State, dt )
    Gamestate.switch(Title)
    return {}
end

local Server = Class{}
Server.Client = nil
Server.send_echoping = false
Server.data = {}
Server.throw_connected = false
Server.time_since_last_rcv = 0

local function onConnect(ip, port)
    print( "connected" )
    if Server.Client == nil then
        Server.throw_connected = true
        Server.Client = ip
    end
end

local function onReceive(data, ip, port)
    print("recv"..data)
    Server.time_since_last_rcv = 0
    if data == "ping" then
        Server.send_echoping = true
    else
        table.insert( Server.data, data )
    end
end

local function onDisconnect(ip, port)
    print("Disconnect")
    love.event.quit()
end

function Server:init()
    self.server = lube.tcpServer()
    self.server.callbacks ={ 
        recv = onReceive, 
        connect = onConnect, 
        disconnect = onDisconnect
    }
    Server.throw_connected = false
    Server.Client = nil
    Server.data = {}
    Server.time_since_last_rcv = 0
    Server.send_echoping = false
    self.server.handshake = "SIGINT THE VIDEO GAME!"
    self.server:listen( 18025 )
    self.turn = 0
end

function Server:update( possible_events, State, event_queue, dt )
    self.server:update( dt )
    if Server.throw_connected then
        print "INSERTED"
        Server.throw_connected = false
        table.insert( event_queue, CONNECTED() )
    end
    if Server.Client ~= nil then
        Server.time_since_last_rcv = Server.time_since_last_rcv + dt
        if Server.time_since_last_rcv > 30 then
            table.insert( event_queue, SERVER_TIMEOUT() )
        end
    end
    if Server.send_echoping then
        Server.send_echoping = false
        self.server:send( "echoping", Server.Client )
    end
    local data = Server.data
    Server.data = {}
    if State.turn % 2 ~= self.turn then
        for _, msg in ipairs( data ) do 
            local event = event_factory( possible_events, msg, State )
            table.insert( event_queue, event )
        end
    end
end

function Server:send_queue( queue, turn )
    --print( #queue )
    if turn % 2 == self.turn then
        for _, event in ipairs(queue) do
            if event.to_net ~= nil then
                msg = json.encode(event:to_net())
                print( "sending "..msg )
                self.server:send( msg, Server.Client )
            end
        end
    end
end

return Server