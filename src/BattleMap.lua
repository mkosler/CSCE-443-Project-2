local Tile = require "src.terrain.tile"
local Graph = require("lib.graph")
local BattleMap = {}
BattleMap.selected_tile = nil
BattleMap.movement_tiles = nil

function BattleMap.init()
    local self = {}
    setmetatable(self,BattleMap)
    self.width = 30
    self.height = 15
    BattleMap.graph = Graph:new()
    local tiles = {}
    for x = 0, self.width, 1 do
        table.insert(tiles, x, {})
        for y = 0, self.height, 1 do
            table.insert( tiles[x], y, Tile.init( x..":"..y, x, y ) )
        end
    end
    for x = 0, self.width, 1 do
        for y = 0, self.height, 1 do
            BattleMap.graph:createNode( tiles[x][y] )
            tiles[x][y].connections[ 0 ] =((math.random() <= .5) and (x<self.width-1))    
            tiles[x][y].connections[ 3 ] =((math.random() <= .5) and (y<self.height-1))
            if x > 0 then
                tiles[x][y].connections[2] = tiles[x-1][y].connections[0]
            end
            if y > 0 then
                tiles[x][y].connections[1] = tiles[x][y-1].connections[3]
            end 
        end
    end
    for x = 0, self.width, 1 do
        for y = 0, self.height, 1 do
            for i = 0, 4, 1 do
                if tiles[x][y].connections[i] then
                    local xi = 0
                    local yi = 0
                    if i == 0 then
                        xi = 1
                    elseif i == 1 then
                        yi = 1
                    elseif i == 2 then
                        xi = -1
                    else
                        yi = -1
                    end
                    BattleMap.graph:add( tiles[x][y], tiles[x+xi][y-yi] )
                end
            end
        end
    end
    self.tiles = tiles
    return self
end

function BattleMap.show_paths( tile, depth )
    BattleMap.movement_tiles = {}
    for i, tile_path in ipairs(BattleMap.graph:findPaths( tile, depth )) do
        for i, tile in ipairs(tile_path) do
            print(tile)
            tile.movement = true
            table.insert( BattleMap.movement_tiles, tile )
        end
    end
end

function BattleMap.selected( object, x, y )
    print "Clicked"
    if BattleMap.selected_tile ~= nil then
        BattleMap.selected_tile.selected = false
        for i, tile in ipairs( BattleMap.movement_tiles ) do
            tile.movement = false
        end
    end
    BattleMap.selected_tile = object.sub_object
    BattleMap.show_paths( BattleMap.selected_tile, 2 )
    object.sub_object:cb_selected( object, x, y )
end

return BattleMap