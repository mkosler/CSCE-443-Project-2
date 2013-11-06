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
    for x = 0, self.width-1, 1 do
        table.insert(tiles, x, {})
        for y = 0, self.height-1, 1 do
            table.insert( tiles[x], y, Tile( x..":"..y, x, y ) )
        end
    end
    for x = 0, self.width-1, 1 do
        for y = 0, self.height-1, 1 do
            BattleMap.graph:createNode( tiles[x][y] )
			--tiles[x][y].connections[ 0 ] =((math.random() <= .3) and (x<self.width-1))    
			--tiles[x][y].connections[ 3 ] =((math.random() <= .3) and (y<self.height))
			if (x < 3 or x>(self.width - 4))then
				tiles[x][y].connections[ 0 ] =(x<self.width-1)    
				tiles[x][y].connections[ 3 ] =(y<self.height)
			end
			if (x%5==0)then
				tiles[x][y].connections[ 3 ] =(y<self.height)
				if (x%5==0)then
					tiles[x][y].connections[ 0 ] =(x<self.width-1)  
				end
			end
			if (y<5 and x<20) then
				tiles[x][y].connections[ 0 ] =(x<self.width) 
				if (((x%3==0) and (y==2))or((x%2==0) and (y==1))or((x%4==0) and (y==0))) then
					tiles[x][y].connections[ 3 ] =(y<self.height)
				end
			end
			if (y>10 and x>10) then
				tiles[x][y].connections[ 0 ] =(x<self.width) 
				if (((x%3==0) and (y==12))or((x%2==0) and (y==13))or((x%4==0) and (y==14))) then
					tiles[x][y].connections[ 3 ] =(y<self.height)
				end
			end
			if (y<5 and x>19 and x<23) then
				tiles[x][y].connections[ 0 ] = 0    
				tiles[x][y].connections[ 3 ] = 0
			end
			if((y==6 and ((x>=10 and x<15)or (x>=25 and  x<30))) or (y==8 and (x>=5 and x<10)) or (y==9 and (x>=20 and x<25)) )then 
				tiles[x][y].connections[ 0 ] =(x<self.width) 
			end
            if x > 0 then
                tiles[x][y].connections[2] = tiles[x-1][y].connections[0]
            end
            if y > 0 then
                tiles[x][y].connections[1] = tiles[x][y-1].connections[3]
            end 
        end
    end
    for x = 0, self.width-1, 1 do
        for y = 0, self.height-1, 1 do
            for i = 0, 3, 1 do
                if tiles[x][y].connections[i] then
                    local xi = 0
                    local yi = 0
                    if i == 0 then
                        xi = 1
                    elseif i == 1 then
                        yi = -1
                    elseif i == 2 then
                        xi = -1
                    else
                        yi = 1
                    end
                    if x+xi < self.width and y+yi < self.height then
                        BattleMap.graph:add( tiles[x][y], tiles[x+xi][y+yi] )
                    else
                        tiles[x][y].connections[i] = false
                    end
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
    local old_tile = BattleMap.selected_tile
    local new_tile = object.sub_object
    local moved = false
    if old_tile ~= nil then
        local unit = old_tile.sub_unit
        if new_tile.movement and new_tile.sub_unit == nil and unit ~= nil then
            old_tile.sub_unit = nil
            unit.x = new_tile.x
            unit.y = new_tile.y
            new_tile.sub_unit = unit
            moved = true
        end
        old_tile.selected = false
        for i, tile in ipairs( BattleMap.movement_tiles ) do
            tile.movement = false
        end
    end
    if not moved then
        if new_tile.sub_unit ~= nil then
            BattleMap.show_paths( new_tile, 2 )
        end
        BattleMap.selected_tile = new_tile
        new_tile:cb_selected( object, x, y )
    else
        BattleMap.selected_tile = nil
    end
end

return BattleMap