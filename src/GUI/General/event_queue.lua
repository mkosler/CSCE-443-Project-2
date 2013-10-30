local event_queue = {}

function event_queue.init()
    local self = {}
    setmetatable(self,event_queue)
    event_queue.events = {}
    return self
end

function event_queue:push( event )
    table.insert( self.events, event )
end

function event_queue:poll()
    local temp_dict = self.events
    self.events = {}
    return temp_dict
end