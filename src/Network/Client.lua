local lube = require "lib.LUBE.LUBE"
local Class = require "lib.class"
require "src.Network.util"

Client.data = Class{}

local function onReceive(data)
    table.insert( Client.data, data )
end

function Client:init()
    self.client = lube.tcpClient()
    self.client.handshake = "SIGINT THE VIDEO GAME!"
    self.client.callbacks = {recv = onReceive}
    assert( self.client:connect("127.0.0.1", 18025, true) )
    self.turn = 1
end

function Client:update( possible_events, State, event_queue, dt )
    self.client:update(dt)
    if State.turn % 2 == self.turn then
        for _, msg in ipairs( Client.data ) do 
            local event = event_factory( possible_events, msg, State )
            table.insert( event_queue, event )
        end
    end
end

function Client:send_queue( queue, turn )
    print( #queue )
    if turn % 2 == self.turn then
        for _, event in ipairs(queue) do
            msg = event:to_net()
            self.Client.send( msg, Server.Client )
        end
    end
end

return Client