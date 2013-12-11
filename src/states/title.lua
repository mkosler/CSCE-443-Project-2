
require( "src.GUI.general.util")
local TitleGUI = require( "src.GUI.Title.TitleGUI" )

local Title = {}

function Title:init()
    self._quit = false
    self._start_local_game = false
    self.turn = 0
    TitleGUI.createTitleGUI( self )
end

function Title:enter(previous)
    loveframes.SetState("Title")
    self.network = nil
    main_menu:play()
end

function Title:leave()
    main_menu:stop()
end

function Title:update(dt)
    TitleGUI.update( self, dt )
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
    
return Title
