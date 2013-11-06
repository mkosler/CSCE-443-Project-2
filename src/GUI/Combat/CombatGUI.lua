
local CombatGUI = {}

local function panel_draw(object)
    local g = love.graphics
    g.setColor( 26, 26, 26, 255 )
    g.rectangle("fill", 0,0, conf.screen.width, conf.screen.height )
    g.setColor( 0, 192, 192, 255 )
    g.rectangle("fill", conf.screen.width/2-10, 0, 20, conf.screen.height )
    --object.left:draw( object.left_button )
    --object.right:draw( object.right_button )
    
    g.setColor(192,0,0,255)
    g.rectangle("fill",0,conf.screen.height-40, conf.screen.width/2-10, 40 )
    g.rectangle("fill",conf.screen.width/2+10,conf.screen.height-40, conf.screen.width/2-10, 40 )
    g.setColor(0, 192, 0, 255 )
    g.rectangle("fill", conf.screen.width/2+10, conf.screen.height-40, (conf.screen.width/2-10)*object.right.hp/100, 40 )
    g.rectangle("fill",0,conf.screen.height-40, (conf.screen.width/2-10)*object.left.hp/100, 40 )
end 

function CombatGUI.create_button(e, i )
    local button = create_text_button( "", i*(conf.screen.width/2+10), conf.screen.height/2, conf.screen.width/2 - 10, conf.screen.height/2-40, "terrain" )
    button.OnClick = function() end
    button.sub_object = e
    return button
end

function CombatGUI.create_panel(Combat_State, left_button, right_button, left, right )
    local panel = create_panel( conf.screen.width, conf.screen.height, "default" )
    panel.left = left
    panel.right = right
    panel.left_button = left
    panel.right_button = right
    panel.Draw = panel_draw
    panel:SetState("Combat")
    left_button:SetParent( panel )
    left_button:SetPos( 0, conf.screen.height/2)
    right_button:SetParent( panel )
    right_button:SetPos( (conf.screen.width/2+10), conf.screen.height/2)
    
    Combat_State.master = panel
end

return CombatGUI