---------------------------------------------------------------
-- Requires ---------------------------------------------------
---------------------------------------------------------------

local bit32 = require 'lib.numberlua'.bit32
local Plain = require 'src.terrain.plain'
local Forest = require 'src.terrain.forest'
local Mountain = require 'src.terrain.mountain'
local Amplifier = require 'src.terrain.amplifier'

---------------------------------------------------------------
-- Private Functions ------------------------------------------
---------------------------------------------------------------

--- Tile creation factory method
-- @param terrain The terrain character
-- @param row The row of the tile
-- @param column The column of the tile
-- @returns The specific tile type
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

--- Set the connections table
-- @param tile The tile to modify
-- @param hex The hex value signifying the connections
-- @returns The modified tile
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

--- Creates an empty 2d array
-- @param rows The number of rows
-- @param columns The number of columns
-- @returns The empty 2d array, represented coordinate-wise as opposed to matrix-wise
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

---------------------------------------------------------------
-- Public Interface -------------------------------------------
---------------------------------------------------------------

--- Loads a given filename into a 2d array of tiles
-- @param filename The path to the file to be read
-- @param rows The number of rows (defaults to 30)
-- @param columns The number of columns (defaults to 15)
-- @returns The 2d array of tiles
local function load(filename, rows, columns)
  assert(type(filename) == 'string', 'Filename must be a string')

  rows = rows or 30
  columns = columns or 15

  local f = io.open(filename):read('*a')
  local n = 0
  local tiles = createTileMap(rows, columns)

  for t, c in f:gmatch('(%a)(%x)') do
    c = tonumber(c, 16)

    local x = n % columns
    local y = math.floor(n / columns)

    tiles[x][y] = setConnections(createTile(t, x, y), c)

    n = n + 1
  end

  return tiles
end

--- Prints a .smf file based on a given 2d array of tiles
-- @param tiles The 2d array of tiles
-- @param filename The path to the .smf file
-- @param rows The number of rows (defaults to 30)
-- @param columns The number of columns (defaults to 15)
local function toFile(tiles, filename, rows, columns)
  assert(type(tiles) == 'table', 'Tiles parameter must be a table')
  assert(type(filename) == 'string', 'Filename parameter must be a string')

  local f = io.open(filename, 'w')

  rows = rows or 30
  columns = columns or 15

  for x = 0, columns - 1 do
    for y = 0, rows - 1 do
      local t = tiles[x][y]

      local connections = 0
      if t.connections[0] then
        connections = connections + 8
      end

      if t.connections[1] then
        connections = connections + 4
      end

      if t.connections[2] then
        connections = connections + 2
      end

      if t.connections[3] then
        connections = connections + 1
      end

      local terrain = string.upper(t.name:sub(1, 1))

      f:write(string.format('%s%X ', terrain, connections))
    end

    f:write('\n')
  end

  f:close()
end

return {
  load = load,
  toFile = toFile,
}
