local Title = {}

function Title:init()
    self.frame = loveframes.Create("frame")
    self.frame:ShowCloseButton(false)
 
    -- method 1 using loveframes.Create
    local_match = loveframes.Create("button", self.frame)
    local_match:SetPos(5, 5)
 
    -- method 2 using SetParent
    local button2 = loveframes.Create("button")
    button2:SetParent(self.frame)
    button2:SetPos(5, 35)
end

function Title:enter(previous)
end

function Title:leave()
end

function Title:update(dt)
end

function Title:draw()
end

function Title:focus()
end

function Title:keypressed(key, code)
end

function Title:keyreleased(key, code)
end

function Title:mousepressed(x, y, button)
end

function Title:mousereleased(x, y, button)
end

function Title:quit()
end

return Title
