local Class = require 'lib.class'
local event = Class{}

function event:init(name)
    self.name = name
end

--This function must always return a table of events( regardless of whether or not it produces events )
function event:act( State, dt )
    return {}
end

return event