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

function skin.set_team( turn_number )
    local team_number = turn_number % 2
    if team_number == 0 then
        skin.controls.team = skin.controls.blue_team
    else
        skin.controls.team = skin.controls.red_team
    end
end

skin.controls.black = { 26, 26, 26, 255 } 
skin.controls.green = { 0, 192, 0, 255 }

skin.controls.team = skin.controls.blue_team

skin.controls.button_text_color = { 0, 192, 0, 255 }

skin.controls.connection_color = { 0, 192, 0, 255 }
skin.controls.button_body_color = { 26, 26, 26, 255 }
skin.controls.button_outline = { 52, 52, 52, 255 }
skin.controls.button_outline_selected = {104, 104, 104, 255}
skin.controls.button_text_font                      = love.graphics.newFont("assets/GUI/Fonts/Terminus.ttf", 15 )
skin.controls.button_text_color = { 0, 192, 0, 255 }

skin.controls.list_body_color                       = { 26, 26, 26, 0 }

skin.controls.button_text_down_color                = {0, 192, 192, 255}
skin.controls.button_text_nohover_color             = {0, 192, 0, 255}
skin.controls.button_text_hover_color               = {0, 255, 0, 255}
skin.controls.button_text_nonclickable_color        = {0, 0, 0, 100}

function skin.DrawFrame(object)
   
end

function skin.DrawPanel(object)
    love.graphics.setColor( skin.controls.team.color )
    love.graphics.rectangle("fill", object:GetX(), object:GetY(), object:GetWidth(), object:GetHeight())
end

function skin.DrawButton(object)
	if object.sub_object ~= nil then
        object.sub_object:draw(object)
    else
        local g = love.graphics
        local skin = object:GetSkin()
        local x = object:GetX()
        local y = object:GetY()
        local width = object:GetWidth()
        local height = object:GetHeight()
        local hover = object:GetHover()
        local text = object:GetText()
        local font = skin.controls.button_text_font
        local twidth = font:getWidth(object.text)
        local theight = font:getHeight(object.text)
        local down = object.down
        local enabled = object:GetEnabled()
        local clickable = object:GetClickable()
        local textdowncolor = skin.controls.button_text_down_color
        local texthovercolor = skin.controls.button_text_hover_color
        local textnohovercolor = skin.controls.team.color
        local textnonclickablecolor = skin.controls.button_text_nonclickable_color

        love.graphics.setColor( skin.controls.button_body_color )
        g.rectangle("fill", object:GetX(), object:GetY(), object:GetWidth(), object:GetHeight())

        if down then
            -- button text
            love.graphics.setFont(font)
            love.graphics.setColor(textdowncolor)
            love.graphics.print(text, x + width/2 - twidth/2, y + height/2 - theight/2)
            -- button border
            love.graphics.setColor(textdowncolor)
            skin.OutlinedRectangle(x, y, width, height)
        elseif hover then
            -- button text
            love.graphics.setFont(font)
            love.graphics.setColor(texthovercolor)
            love.graphics.print(text, x + width/2 - twidth/2, y + height/2 - theight/2)
            -- button border
            love.graphics.setColor(texthovercolor)
            skin.OutlinedRectangle(x, y, width, height)
        else
            -- button text
            love.graphics.setFont(font)
            love.graphics.setColor(textnohovercolor)
            love.graphics.print(text, x + width/2 - twidth/2, y + height/2 - theight/2)
            -- button border
            love.graphics.setColor(textnohovercolor)
            skin.OutlinedRectangle(x, y, width, height)
        end
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