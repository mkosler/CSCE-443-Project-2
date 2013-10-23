
local skin = {}
local g = love.graphics

skin.name = "default"
skin.author = "WamS"
skin.version = "1.0"

skin.controls.frame_color = { 192, 192, 192, 255 }
skin.controls.panel_color

function skin.DrawFrame(object)
    g.setColor( skin.controls.frame_color )
    g.rectangle("fill", object:GetX(), object:GetY(), object:GetWidth(), object:GetHeight())
end

function skin.DrawPanel(object)
    g.setColor( skin.controls.panel_color )
    g.rectangle("fill", object:GetX(), object:GetY(), object:GetWidth(), object:GetHeight())
end

return skin