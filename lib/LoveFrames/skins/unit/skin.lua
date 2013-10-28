--Unit
local skin = {}

skin.name = "unit"
skin.author = "WamS"
skin.version = "1.0"

skin.controls = {}

skin.controls.button_body_color = { 26, 26, 26, 0 }
skin.controls.button_text_font                      = love.graphics.newFont("assets/GUI/Fonts/Terminus.ttf", 9 )
skin.controls.button_text_color = { 0, 192, 0, 255 }

skin.controls.list_body_color                       = { 26, 26, 26, 0 }

function skin.DrawFrame(object)
   
end

function skin.DrawPanel(object)
    
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