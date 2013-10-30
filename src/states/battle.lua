
local BattleMap = require( "src.BattleMap" )
local BattleGUI = require( "src.GUI.Battle.BattleGUI" )

------------------------------------------------------------------------
-- Functions -----------------------------------------------------------
------------------------------------------------------------------------


local Battle = {}

function Battle.create_test_map()
    local map = BattleMap.init()
    return map
end

function Battle.create_test_units()
    local hv = require( "src.entities.vehicle.heavyvehicle" )
    hv:init( 1, 1, 0 )
    local li = require( "src.entities.infantry.lightinfantry" )
    li:init( 1, 2, 1 )
    local heli = require( "src.entities.helicopter" )
    heli:init( 2, 2, 1 )
    return { hv, li, heli }
    --local test_types
    --local units = {}
    --for i=0, 5, 1 do
        
    --end    
end


--- Initialize the state
-- Called only once after LOVE modules are loaded
-- Useful for loading in sprites and other memory heavy objects
function Battle:init()
end

--- Set up state once entered
-- Called after every Gamestate.switch()
-- @param previous The previous gamestate
function Battle:enter(previous)
    Battle.map = Battle.create_test_map()
    Battle.units = Battle.create_test_units()
    loveframes.SetState("Battle")
    BattleGUI.createBattleGUI( self )
end

--- Tear down the state when leaving
-- Called after every Gamestate.switch()
function Battle:leave()
    Battle.master:Remove()
    Battle.master = nil
    Battle.game_master = nil
    Battle.map = nil
end

--- Update the state
-- Called once every frame before any draw calls
-- @param dt The time between the last frame and the current frame (deltatime)
function Battle:update(dt)
end

--- Draw the state
-- Called once every frame after every update call
function Battle:draw()
end

--- Gained focus during this state
-- Called whenever we return focus to this state
-- i.e. when I alt-tab or click back into the window
function Battle:focus()
end

--- Handles key press events for the state
-- @param key The key pressed in the event, as a string (http://www.love2d.org/wiki/KeyConstant)
-- @param code The ASCII value of the key pressed in the event
function Battle:keypressed(key, code)
end

--- Handles key release events for the state
-- @param key The key pressed in the event, as a string (http://www.love2d.org/wiki/KeyConstant)
-- @param code The ASCII value of the key pressed in the event
function Battle:keyreleased(key, code)
    if key == 'b' then
        Gamestate.switch(Title)
    end
end

--- Handles the mouse press events for the state
-- @param x The x-coordinate of the mouse in the event
-- @param y The y-coordinate of the mouse in the event
-- @param button The button pressed in the event, as a string (http://www.love2d.org/wiki/MouseConstant)
function Battle:mousepressed(x, y, button)
end

--- Handles the mouse release events for the state
-- @param x The x-coordinate of the mouse in the event
-- @param y The y-coordinate of the mouse in the event
-- @param button The button pressed in the event, as a string (http://www.love2d.org/wiki/MouseConstant)
function Battle:mousereleased(x, y, button)
end

--- Handles the game quit event in the state
-- This is only called once the executable is exited
-- Useful for cleaning up memory or cleaning up network connections
function Battle:quit()
    Gamestate.switch(Title)
end

return Battle
