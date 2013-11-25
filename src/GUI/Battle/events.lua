local Class = require 'lib.class'
local event = require( "src.GUI.General.event" )

local events = {}
local SELECT_TILE = Class{ __includes = event }
local HIGHLIGHT_MOVEMENT = Class{ __includes = event }
local HIGHLIGHT_ATTACK = Class{ __includes = event }
SELECT_TILE.selected_tile = nil

function SELECT_TILE:init( selected )
    event.init( self, "SELECT_TILE" )
    self.selected = selected
end

function SELECT_TILE:act( State, dt )
    if State:is_user_turn() then
        if SELECT_TILE.selected_tile ~= nil then
            SELECT_TILE.selected_tile.selected = false
        end
        self.selected.selected = true
        SELECT_TILE.selected_tile = self.selected
    end
    return {HIGHLIGHT_MOVEMENT(self.selected), HIGHLIGHT_ATTACK(self.selected)}
end

events.SELECT_TILE = SELECT_TILE

-- pathing helper functions --

local function get_graph_paths( graph, origin_tile, depth )
    local tiles = {}
    for i, tile_path in ipairs(graph:findPaths( origin_tile, depth )) do
        local length = #tile_path
        if length >= 0 then
            table.insert( tiles, tile_path[length] )
        end
    end
    return tiles
end

function get_grid_paths( map_tiles, origin_tile, depth )
    local tiles = { }
    local x = origin_tile.x
    local y = origin_tile.y
    for xi = -depth, depth, 1 do
        if x+xi >= 0  and x+xi < #map_tiles then
            local yi_min_max = (depth-math.abs(xi))
            for yi = -yi_min_max, yi_min_max, 1 do 
                if y+yi >= 0 and y+yi < #(map_tiles[0]) then
                    table.insert( tiles, map_tiles[x+xi][y+yi] )
                end
            end
        end
    end
    return tiles
end

-- tile highlight events --
HIGHLIGHT_MOVEMENT.movement_tiles = {}

function HIGHLIGHT_MOVEMENT.unhighlight()
    for i, tile in ipairs( HIGHLIGHT_MOVEMENT.movement_tiles ) do
        tile.movement = false
    end
end

function HIGHLIGHT_MOVEMENT.highlight()
    for i, tile in ipairs( HIGHLIGHT_MOVEMENT.movement_tiles ) do
        tile.movement = true
    end
end

function HIGHLIGHT_MOVEMENT:init( origin )
    event.init( self, "HIGHLIGHT_MOVEMENT" )
    HIGHLIGHT_MOVEMENT.unhighlight()    
    self.unit = origin.sub_unit
    self.origin = origin
end

function HIGHLIGHT_MOVEMENT:act( State, dt )
    if self.unit ~= nil then
        if self.unit.name == "HELICOPTER" then
            HIGHLIGHT_MOVEMENT.movement_tiles = get_grid_paths( State.map.tiles, self.origin, self.unit.move )
        else
            HIGHLIGHT_MOVEMENT.movement_tiles = get_graph_paths( State.map.graph, self.origin, self.unit.move )
        end
    else
        HIGHLIGHT_MOVEMENT.movement_tiles = {}
    end
    HIGHLIGHT_MOVEMENT.highlight()
    return {}
end

HIGHLIGHT_ATTACK.attack_tiles = {}

function HIGHLIGHT_ATTACK.unhighlight()
    for i, tile in ipairs( HIGHLIGHT_ATTACK.attack_tiles ) do
        tile.attack = false
    end
end

function HIGHLIGHT_ATTACK:highlight()
    for i, tile in ipairs(HIGHLIGHT_ATTACK.attack_tiles) do
        if tile.sub_unit ~= nil and self.unit~=nil then
            if tile.sub_unit.side ~= self.unit.side then
                tile.attack = true
            end
        end
    end
end

function HIGHLIGHT_ATTACK:init( origin )
    event.init( self, "HIGHLIGHT_ATTACK" )
    HIGHLIGHT_ATTACK.unhighlight()
    self.unit = origin.sub_unit
    self.origin = origin
end

function HIGHLIGHT_ATTACK:act( State, dt )
    if self.unit ~= nil then
        HIGHLIGHT_ATTACK.attack_tiles = get_grid_paths( State.map.tiles, self.origin, self.unit.attack_range )
        self:highlight()
    else
        HIGHLIGHT_ATTACK.attack_tiles = {}
    end 
    return {}
end

-- BEGAN MOVE EVENTS --
local MOVE_UNIT = Class{ __includes = event }
local MOVING_UNIT = Class{ __includes = event }
local MOVED_UNIT = Class{ __includes = event }

function MOVE_UNIT:init( from_tile, to_tile )
    event.init( self, "MOVE_UNIT" )
    self.unit = from_tile.sub_unit
    self.from_tile = from_tile
    self.to_tile = to_tile
end

function MOVE_UNIT:act( State, dt )
    if self.unit:is_units_turn( State ) and not self.unit.moved then
        self.unit.moved = true
        self.from_tile.sub_unit = nil
        return {MOVING_UNIT(self.unit, self.from_tile, self.to_tile)}
    end
    return {}
end

MOVING_UNIT.movement_animation_length = 1

function MOVING_UNIT:init( unit, from_tile, to_tile )
    event.init( self, "MOVING_UNIT" )
    self.time = 0
    self.unit = unit
    self.from_tile = from_tile
    self.to_tile = to_tile
end

function MOVING_UNIT:act( State, dt )
    self.time = self.time + dt
    if self.time > MOVING_UNIT.movement_animation_length then
        return { MOVED_UNIT( self.unit, self.to_tile ) }
    end
    State.GUI.event_queue:push( self )
    return {}
end

function MOVED_UNIT:init( unit, to_tile )
    event.init( self, "MOVED_UNIT" )
    print( tostring(unit) )
    self.unit = unit
    self.to_tile = to_tile
end

function MOVED_UNIT:act( State, dt )
    print( tostring(self.unit) )
    self.to_tile.sub_unit = self.unit
    self.unit.x = self.to_tile.x
    self.unit.y = self.to_tile.y
    HIGHLIGHT_MOVEMENT.unhighlight()
    HIGHLIGHT_ATTACK.unhighlight()
    return {}
end

-- END MOVE EVENTS --

-- Attack event--

local ATTACK_UNIT = Class{ __includes = event }

function ATTACK_UNIT:init( tile1, tile2 )
    self.attack_terrain = tile1
    self.defend_terrain = tile2
    self.attacking_unit = tile1.sub_unit
    self.defending_unit = tile2.sub_unit
end

function ATTACK_UNIT:act( State, dt )
    if not self.attacking_unit.attacked and self.attacking_unit:is_units_turn( State )  then
        self.attacking_unit.moved = true
        self.attacking_unit.attacked = true
        Gamestate.switch(Combat, self.attacking_unit, self.defending_unit, self.attack_terrain, self.defend_terrain )
    end
    return {}
end

local INTERACT_WITH = Class{ __includes = event }

function INTERACT_WITH:init( tile1, tile2 )
    event.init( self, "INTERACT_WITH" )
    self.tile1 = tile1
    self.tile2 = tile2
end

function INTERACT_WITH:act( State, dt )
    local return_events = {}
    if self.tile2.attack then
        table.insert( return_events, ATTACK_UNIT(self.tile1, self.tile2) )
    elseif self.tile2.movement then
        table.insert( return_events, MOVE_UNIT(self.tile1, self.tile2) )
    else
        table.insert( return_events, SELECTED_TILE(self.tile2) )
    end
    return return_events
end

events.INTERACT_WITH = INTERACT_WITH

-- End Turn --

local END_TURN = Class{ __includes = event }

function END_TURN:init()
    event.init( self, "END_TURN" )
end

function END_TURN:act( State, dt )
    State.turn = State.turn + 1
    State.map.turn = State.turn
    SELECT_TILE.selected_tile = nil
    HIGHLIGHT_MOVEMENT.unhighlight()
    HIGHLIGHT_ATTACK.unhighlight()
     for _,unit in ipairs( State.units ) do
        unit.moved = false
        unit.attacked = false
    end
    loveframes.skins.Get("teamui").set_team( State.turn )
    return {}
end

events.END_TURN = END_TURN

local EXIT_BATTLE_MAP = Class{ __includes = event }

function EXIT_BATTLE_MAP:init()
    event.init(self, "EXIT_BATTLE_MAP" )
end

function EXIT_BATTLE_MAP:act( State, dt )
    Gamestate.switch(Title)
    return {}
end

events.EXIT_BATTLE_MAP = EXIT_BATTLE_MAP

return events