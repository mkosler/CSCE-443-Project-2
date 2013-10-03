local Gamestate = require 'lib.gamestate'

function love.load()
end

function love.keypressed(key, code)
  if key == 'escape' then
    love.event.quit()
  end
end
