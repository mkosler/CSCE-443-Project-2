------------------------------------------------------------------------
-- LIBRARIES -----------------------------------------------------------
------------------------------------------------------------------------

local Gamestate = require 'lib.gamestate'

------------------------------------------------------------------------
-- GAMESTATES ----------------------------------------------------------
------------------------------------------------------------------------

local Title = require 'src.states.title'

------------------------------------------------------------------------
-- FUNCTIONS -----------------------------------------------------------
------------------------------------------------------------------------

--- Called after LOVE modules loaded
function love.load()
  -- Register the Gamestate module, so we don't have to worry about
  -- calling the individual callbacks manually
  Gamestate.registerEvents()

  -- Switch to the Title Gamestate
  Gamestate.switch(Title)
end

--- Register any global keypresses, as this is the uppermost version
-- of the keypressed callbacks
function love.keypressed(key, code)
  -- Easy quitting for debug purposes
  if key == 'escape' then
    love.event.quit()
  end
end
