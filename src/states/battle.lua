local Gamestate = require 'lib.gamestate'
require( "src.GUI.general.util")
BattleGUI = require( "src.GUI.Title.BattleGUI" )
local Battle = {}

function Battle:init()
end

function Battle:enter(previous)
    loveframes.SetState("Battle")
end

function Battle:leave()
end

function Battle:update(dt)
end

function Battle:draw()
end

function Battle:focus()
end

function Battle:keypressed(key, code)
end

function Battle:keyreleased(key, code)
end

function Battle:mousepressed(x, y, button)
end

function Battle:mousereleased(x, y, button)
end

function Battle:quit()
    Gamestate.switch(Title)
end

return Battle
