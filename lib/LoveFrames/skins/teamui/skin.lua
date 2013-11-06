--Unit
local skin = {}

skin.name = "teamui"
skin.author = "WamS"
skin.version = "1.0"

skin.controls = {}

skin.controls.blue_team = {}
skin.controls.blue_team.color = { 0, 192, 192, 255 }

skin.controls.red_team = {}
skin.controls.red_team.color = { 192, 0, 0, 255 }

function skin.get_team_color( team_number )
    if team_number == 0 then
        return skin.controls.blue_team.color
    elseif team_number == 1 then
        return skin.controls.red_team.color
    else
        return { 0, 192, 0, 255 }
    end
end
skin.controls.black = { 26, 26, 26, 255 } 
skin.controls.green = { 0, 192, 0, 255 }

skin.controls.team = skin.controls.blue_team
skin.controls.button_text_font                      = love.graphics.newFont("assets/GUI/Fonts/Terminus.ttf", 9 )

skin.controls.button_text_color = { 0, 192, 0, 255 }

skin.controls.connection_color = { 0, 192, 0, 255 }
skin.controls.button_body_color = { 26, 26, 26, 255 }
--skin.controls.button_body_movement = {0, 104, 104, 255}
--skin.controls.button_body_attack = { 104, 0, 0, 255 }
--skin.controls.button_outline = { 52, 52, 52, 255 }
--skin.controls.button_outline_selected = {104, 104, 104, 255}
--skin.controls.button_text_font                      = love.graphics.newFont("assets/GUI/Fonts/Terminus.ttf", 9 )
--skin.controls.button_text_color = { 0, 192, 0, 255 }

skin.controls.list_body_color                       = { 26, 26, 26, 0 }

function skin.DrawFrame(object)
   
end

function skin.DrawPanel(object)
    love.graphics.setColor( skin.controls.team.color )
    love.graphics.rectangle("fill", object:GetX(), object:GetY(), object:GetWidth(), object:GetHeight())
end

function skin.DrawButton(object)
	if object.sub_object ~= nil then
        object.sub_object:draw(object)
    end
end

function skin.OutlinedRectangle(x, y, width, height, ovt, ovb, ovl, ovr)

	local ovt = ovt or false
	local ovb = ovb or false
	local ovl = ovl or false
	local ovr = ovr or false
	
	-- top
	if not ovt then
		love.graphics.rectangle("fill", x, y, width, 1)
	end
	
	-- bottom
	if not ovb then
		love.graphics.rectangle("fill", x, y + height - 1, width, 1)
	end
	
	-- left
	if not ovl then
		love.graphics.rectangle("fill", x, y, 1, height)
	end
	
	-- right
	if not ovr then
		love.graphics.rectangle("fill", x + width - 1, y, 1, height)
	end
	
end

function skin.DrawGrid(object)

end

loveframes.skins.Register(skin)