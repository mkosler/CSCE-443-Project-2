local event = {}

function event.init(name)
    local self = {}
    setmetatable(self, event)
    self.name = name
end