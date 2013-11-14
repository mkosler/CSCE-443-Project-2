local Graph = {}
Graph.__index = Graph

--- Constructor
function Graph:new()
  return setmetatable({
    _nodes = setmetatable({}, { __mode = 'k' }),
  }, self)
end

--- Create a pathfinding node for the graph to work with
-- Pathfinding nodes are indexed by the creator node
-- The _nodes table is a weak keyed table, so there shouldn't
-- be any memory issues
function Graph:createNode(o)
  self._nodes[o] = {
    _path = {},
    _depth = 0,
    neighbors = setmetatable({}, { __mode = 'v' }),
    _creator = o,
  }
end

--- Test adjacency of two creator nodes
-- @param x The node contoining the out edge
-- @param y The node containing the in edge
-- @returns Whether there is a directed edge between x and y
function Graph:adjacent(x, y)
  for _,v in pairs(self._nodes[x].neighbors) do
    if v == y then return true end
  end

  return false
end

--- Prints the neighbors of a given node
-- @param x The creator node
function Graph:neighbors(x)
  for _,v in pairs(self._nodes[x].neighbors) do
    print(v)
  end
end

--- Adds a directed edge between two given creator nodes
-- @param x The creator node to contain the out edge
-- @param y The creator node to contain the in edge
function Graph:add(x, y)
  table.insert(self._nodes[x].neighbors, y)
end

--- Removes a directed edge between two given creator nodes
-- @param x The creator node that contains the out edge
-- @param y The creator node that contains the in edge
function Graph:delete(x, y)
  for i,v in pairs(self._nodes[x].neighbors) do
    if v == y then
      table.remove(self._nodes[x])
    end
  end
end

local function search(t, o)
  for _,v in pairs(t) do
    if v == o then return true end
  end

  return false
end

local function shallow(t)
  local nt = {}
  for k,v in pairs(t) do
    nt[k] = v
  end
  return nt
end

--- Finds all paths of a given length (depth) emanating from a given creator node
-- @param o The creator node from which the paths emanate
-- @param depth The maximum length (depth) of the paths
-- @returns A set of creator node paths of the given length
function Graph:findPaths(o, depth)
  for _,v in pairs(self._nodes) do
    v._path = {}
    v._depth = 0
  end

  local queue = {}
  local set = {}

  self._nodes[o]._path = { o }
  table.insert(queue, 1, self._nodes[o])
  table.insert(set, self._nodes[o])

  local paths = {}
  while #queue > 0 do
    local t = table.remove(queue)

    if t._depth ~= depth then
      for _,u in pairs(t.neighbors) do
        local neighbor = self._nodes[u]

        if not search(set, neighbor) then
          -- Build the new path from the parent path
          local p = shallow(t._path)
          table.insert(p, u)

          -- Set the new path
          neighbor._path = p

          -- Add the path to the collection
          table.insert(paths, p)

          -- Set the depth
          neighbor._depth = t._depth + 1

          -- Add it to the set and queue
          table.insert(set, neighbor)
          table.insert(queue, 1, neighbor)
        end
      end
    end
  end

  if #paths == 0 then
    error('Error finding paths. Perhaps the depth is larger than possible?')
  end

  return paths
end

function Graph:__tostring()
  for k,v in pairs(self._nodes) do
    print(k)
    for i,w in pairs(v.neighbors) do
      print('\t', i, w)
    end
  end
end

return Graph
