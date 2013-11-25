local lube = require "lib.LUBE.LUBE"
local Class = require "lib.class"
require "src.Network.util"

local Server = Class{}
Server.Client = nil
Server.data = {}

local function onConnect(ip, port)
    print( "connected"..ip)
    if Server.Client == nil then
        Server.Client = ip
    end
end

local function onReceive(data, ip, port)
    print("recv"..data)
    table.insert( Server.data, data )
end

local function onDisconnect(ip, port)
    print("Disconnect"..ip)
    love.event.quit()
end

function Server:init()
    self.server = lube.tcpServer
    self.server.callbacks ={ 
        recv = onReceive, 
        connect = onConnect, 
        disconnect = onDisconnect
    }
    self.server.timeout = 30
    
    self.server.handshake = "SIGINT THE VIDEO GAME!"
    self.server:createSocket()
    self.server:listen( 18025 )
    self.server:accept()
    self.turn = 0
end

function Server:update( possible_events, State, event_queue, dt )
    self.server:update(dt)
    if State.turn % 2 == self.turn then
        for _, msg in ipairs( Server.data ) do 
            local event = event_factory( possible_events, msg, State )
            table.insert( event_queue, event )
        end
    end
end

function Server:send_queue( queue, turn )
    print( #queue )
    if turn % 2 == self.turn then
        for _, event in ipairs(queue) do
            msg = event:to_net()
            print( "sending "..msg )
            self.server.send( msg, Server.Client )
        end
    end
end

return Server