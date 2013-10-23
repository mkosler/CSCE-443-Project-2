local Graph = {}
Graph.__index = Graph

-- Implement pathing
-- Implement flood pathing for a specific move count, for the GUI

function Graph:new()
  return setmetatable({
    _nodes = setmetatable({}, { __mode = 'k' }),
  }, self)
end

function Graph:createNode(o)
  self._nodes[o] = {
    _parent = nil,
    neighbors = setmetatable({}, { __mode = 'v' }),
    _creator = o,
  }
end

function Graph:adjacent(x, y)
  for _,v in pairs(self._nodes[x].neighbors) do
    if v == y then return true end
  end

  return false
end

function Graph:neighbors(x)
  for _,v in pairs(self._nodes[x].neighbors) do
    print(v)
  end
end

function Graph:add(x, y)
  table.insert(self._nodes[x].neighbors, y)
end

function Graph:delete(x, y)
  for i,v in pairs(self._nodes[x].neighbors) do
    if v == y then
      table.remove(self._nodes[x])
    end
  end
end

local function DFS(graph, o, depth, exits)
  if depth == 0 then
    table.insert(exits, o)
    return
  end

  for _,v in pairs(o.neighbors) do
    local node = graph[v]
    if node._parent == nil then
      node._parent = o
      DFS(graph, node, depth - 1, exits)
    end
  end
end

local function buildPath(o)
  local path = { o._creator }

  while o._parent ~= o do
    o = o._parent
    table.insert(path, o._creator)
  end

  return path
end

function Graph:findPaths(o, depth)
  -- Reset the _parent flag
  for _,v in pairs(self._nodes) do
    v._parent = nil
  end

  -- Set beginning node's _parent to itself
  self._nodes[o]._parent = self._nodes[o]

  -- Set the parent flags and get the exits
  local exits = {}
  DFS(self._nodes, self._nodes[o], depth, exits)

  -- Build the paths from the exits
  local paths = {}
  for _,exit in ipairs(exits) do
    table.insert(paths, buildPath(exit))
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
