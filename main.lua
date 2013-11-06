------------------------------------------------------------------------
-- LIBRARIES -----------------------------------------------------------
------------------------------------------------------------------------
 -- load GUI Lib( LoveFrames 0.9.6.4 Alpha )
require('lib.LoveFrames')
-- load Networking lib
require('lib.LUBE.LUBE')
COMBAT_DEFAULTS = require( "combat" )
Gamestate = require 'lib.gamestate'
Title = require 'src.states.title'
Battle = require 'src.states.battle'
Combat = require 'src.states.combat'
------------------------------------------------------------------------
-- GAMESTATES ----------------------------------------------------------
------------------------------------------------------------------------

local Title = require 'src.states.title'

------------------------------------------------------------------------
-- FUNCTIONS -----------------------------------------------------------
------------------------------------------------------------------------

--- Called after LOVE modules loaded
function love.load()
    Gamestate.registerEvents()
    Gamestate.switch(Title)
end

function love.update(dt)
    --update loop
    loveframes.update(dt)
end

function love.draw()
    loveframes.draw()
end

function love.mousepressed( x, y, button )
    loveframes.mousepressed( x, y, button )
end

function love.mousereleased( x, y, button )
    loveframes.mousereleased( x, y, button )
end

function love.keypressed(key, code)
    loveframes.keypressed( key, code )
end

function love.keyreleased(key, code)
    if key == 'escape' then
        love.event.quit()
    end
end

function love.quit()
    print('Quitting...')
end