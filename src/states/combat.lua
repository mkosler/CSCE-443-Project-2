local Combat = {}

function Combat:init()
end

function Combat:enter(previous, unit1, unit2)
    self.unit1 = unit1
    self.unit2 = unit2

    -- Perform combat calculations inside the enter function
end

function Combat:leave()
end

function Combat:update(dt)
end

function Combat:draw()
end

function Combat:focus()
end

function Combat:keypressed(key, code)
end

function Combat:keyreleased(key, code)
end

function Combat:mousepressed(x, y, button)
end

function Combat:quit()
end

return Combat
