------------------------------------------------------------------------
-- LIBRARIES -----------------------------------------------------------
------------------------------------------------------------------------

local Gamestate = require 'lib.gamestate'

------------------------------------------------------------------------
-- GAMESTATES ----------------------------------------------------------
------------------------------------------------------------------------

local play = require 'src.states.play'

function love.load()
  Gamestate.registerEvents()
  Gamestate.switch(play)
end

function love.keypressed(key, code)
  -- Easy quitting for debug purposes
  if key == 'escape' then
    love.event.quit()
  end
end

function love.quit()
  print('Quitting...')
end
