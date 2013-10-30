
require( "src.GUI.general.util")
TitleGUI = require( "src.GUI.Title.TitleGUI" )

local Title = {}

function Title:init()
    self._quit = false
    self._start_local_game = false
    TitleGUI.createTitleGUI( self )
end

function Title:enter(previous)
    loveframes.SetState("Title")
end

function Title:leave()
end

function Title:update(dt)
    self:check_for_state_change()
end

function Title:draw()
end

function Title:focus()
end

function Title:keypressed(key, code)
end

function Title:keyreleased(key, code)
end

function Title:mousepressed(x, y, button)
end

function Title:mousereleased(x, y, button)
end

function Title:quit()
end

function Title:check_for_state_change()
    if self._quit then
        love.event.quit()
    end
    if self._start_local_game then
        self._start_local_game = false
        Gamestate.switch(Battle)
    end
end
    
return Title
