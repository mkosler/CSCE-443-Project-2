local bit32 = require 'lib.numberlua'.bit32
local Plain = require 'src.terrain.plain'
local Forest = require 'src.terrain.forest'
local Mountain = require 'src.terrain.mountain'
local Amplifier = require 'src.terrain.amplifier'

local function createTile(terrain, row, column)
  terrain = string.lower(terrain)

  if terrain == 'p' then
    return Plain(0, 0, 0, 0)
  elseif terrain == 'f' then
    return Forest(0, 0, 0, 0)
  elseif terrain == 'm' then
    return Mountain(0, 0, 0, 0)
  elseif terrain == 'a' then
    return Amplifier(0, 0, 0, 0)
  else
    error('Unknown terrain type')
  end
end

local function setConnections(tile, hex)
  if bit32.band(hex, 8) == 8 then
    tile.connections[0] = true
  end

  if bit32.band(hex, 4) == 4 then
    tile.connections[1] = true
  end

  if bit32.band(hex, 2) == 2 then
    tile.connections[2] = true
  end
  
  if bit32.band(hex, 1) == 1 then
    tile.connections[3] = true
  end

  return tile
end

local function createTileMap(rows, columns)
  local tiles = {}

  for x = 0, columns - 1 do
    tiles[x] = {}
    for y = 0, rows - 1 do
      tiles[x][y] = nil
    end
  end

  return tiles
end

local function load(filename, rows, columns)
  assert(type(filename) == 'string', 'Filename must be a string')

  rows = rows or 30
  columns = columns or 15

  local f = io.open(filename):read('*a')
  local n = 0
  local tiles = createTileMap(rows, columns)

  for t, c in f:gmatch('(%a)(%x)') do
    c = tonumber(c, 16)

    local lc = n % columns
    local lr = math.floor(n / columns)

    tiles[lc][lr] = setConnections(createTile(t, lr, lc), c)
    print(lc, lr)
    print(tiles[lc][lr])
    for i = 0, #tiles[lc][lr].connections do
      print(i, tiles[lc][lr].connections[i] and 'true' or 'false')
    end
    print()

    n = n + 1
  end

  return tiles
end

local function pprint(tiles)
  for x = 0, 29 do
    for y = 0, 14 do
      print(x, y)
      local t = tiles[x][y]
      print(t.name)
      print('{' .. table.concat(t.connections, ', ') ..'}')
    end
  end
end

return {
  load = load,
  pprint = pprint,
}
