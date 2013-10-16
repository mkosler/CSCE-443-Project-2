------------------------------------------------------------------------
-- LIBRARIES -----------------------------------------------------------
------------------------------------------------------------------------

local Gamestate = require 'lib.gamestate'

------------------------------------------------------------------------
-- GAMESTATES ----------------------------------------------------------
------------------------------------------------------------------------

function love.load()
  Gamestate.registerEvents()
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
