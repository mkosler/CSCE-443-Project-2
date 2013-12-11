--inferno = love.audio.newSource("assets/18397__inferno__smalllas.wav", "static")
confirmation1 = love.audio.newSource("assets/confirmation.wav", "static")
confirmation2 = love.audio.newSource("assets/confirmation2.wav", "static")
denied = love.audio.newSource("assets/Denied.wav", "static" )
destroyed_a_unit = love.audio.newSource("assets/destroyed-any-unit.wav", "static" )
charging_hv_shot = love.audio.newSource("assets/hv-shot.mp3", "static")
hv_shot = love.audio.newSource("assets/hv-shot.wav", "static" )
hit_infantry = love.audio.newSource("assets/I-hit.wav", "static")
li_shot = love.audio.newSource( "assets/LI-shoot.wav", "static" )
lv_shot = love.audio.newSource( "assets/LV-shot.wav", "static" )
main_menu = love.audio.newSource( "assets/Main_Menu.mp3" )
movement1 = love.audio.newSource( "assets/movement.wav", "static" )
movement2 = love.audio.newSource( "assets/movement2.wav", "static" )
sigint = love.audio.newSource( "assets/SIGINT.mp3" )
hit_vechicle = love.audio.newSource("assets/v-hit.wav", "static" )

main_menu:setLooping(true)
sigint:setLooping(true)

function get_confirmation()
    local confirm = { confirmation1, confirmation2 }
    return confirm[math.random(2)]
end

function get_movement()
    local move = { movement1, movement2 }
    return move[math.random(2)]
end