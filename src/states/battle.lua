
local BattleMap = require( "src.BattleMap" )
local BattleGUI = require( "src.GUI.Battle.BattleGUI" )

------------------------------------------------------------------------
-- Functions -----------------------------------------------------------
------------------------------------------------------------------------


local Battle = {}

function Battle.create_test_map()
    local map = BattleMap()
    return map
end

function Battle.create_test_units()
    local HV = require( "src.entities.vehicle.heavyvehicle" )
    hv = HV( 0, 0, 0 )
    hv1 = HV( 1, 0, 0 )
    hv2 = HV( 29, 0, 1 )
    hv3 = HV( 28, 0, 1 )
    local LI = require( "src.entities.infantry.lightinfantry" )
    li = LI( 0, 1, 1 )
    local HELI = require( "src.entities.helicopter" )
    heli = HELI( 1, 0, 1 )
    
    return { hv, hv1, hv2, hv3,  li, heli }
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
function Battle:enter(previous, reset)
    if reset then
        if Battle.master ~= nil then
            Battle.master:Remove()
        end
        Battle.master = nil
        Battle.game_master = nil
        Battle.map = nil
        Battle.GUI = BattleGUI
        self.map = Battle.create_test_map()
        self.units = Battle.create_test_units()
        self.turn = 0
        BattleGUI.createBattleGUI( self )
    end
    loveframes.SetState("Battle")
end

--- Tear down the state when leaving
-- Called after every Gamestate.switch()
function Battle:leave()
    
end

--- Update the state
-- Called once every frame before any draw calls
-- @param dt The time between the last frame and the current frame (deltatime)
function Battle:update(dt)
    BattleGUI.update(self,dt)
    for i, unit in ipairs(Battle.units) do
        if unit.is_dead then
            self.map.tiles[unit.x][unit.y].sub_unit = nil
        end
    end
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

function Battle:is_user_turn()
    return true
end

return Battle
