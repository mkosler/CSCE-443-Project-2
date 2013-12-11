--local lube = require "lib.LUBE.LUBE"
local Class = require "lib.class"
require "lib.json"
require "src.Network.util"

local event = require( "src.GUI.General.event" )

local CLIENT_TIMEOUT = Class{ __includes = event }

function CLIENT_TIMEOUT:init( )
    event.init( self, "CLIENT_TIMEOUT" )
end

function CLIENT_TIMEOUT:act( State, dt )
    Gamestate.switch(Title)
    return {}
end

Client = Class{}
Client.data = {}
Client.time_since_last_rcv = 0

local function onReceive(data)
    print("received"..data)
    Client.time_since_last_rcv = 0
    if data~="echoping" then
        table.insert( Client.data, data )
    end
end

function Client:init(address)
    print "hello"
    self.client = lube.tcpClient()
    self.client.handshake = "SIGINT THE VIDEO GAME!"
    self.client.callbacks = {recv = onReceive}
    self.client:connect(address, 18025, true)
    Client.data = {}
    Client.time_since_last_rcv = 0
    self.turn = 1
    self.client:setPing( true, 10, "ping" )
end

function Client:update( possible_events, State, event_queue, dt )
    self.client:update(dt)
    local data = Client.data
    Client.data = {}
    Client.time_since_last_rcv = Client.time_since_last_rcv + dt
    if Client.time_since_last_rcv > 30 then
        table.insert( event_queue, CLIENT_TIMEOUT() )
    end
    if State.turn % 2 ~= self.turn then
        for _, msg in ipairs( data ) do 
            local event = event_factory( possible_events, msg, State )
            table.insert( event_queue, event )
        end
    end
end

function Client:send_queue( queue, turn )
    --print( #queue )
    if turn % 2 == self.turn then
        for _, event in ipairs(queue) do
            if event.to_net ~= nil then
                msg = json.encode(event:to_net())
                self.client.send( msg )
            end
        end
    end
end

return Client