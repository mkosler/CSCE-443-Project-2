local Graph = {}
Graph.__index = Graph

-- Implement pathing
-- Implement flood pathing for a specific move count, for the GUI

function Graph:new(width, height)
  return setmetatable({
    _nodes = setmetatable({}, { __mode = 'k' }),
  }, self)
end

function Graph:createNode(o)
  self._nodes[o] = setmetatable({}, { __mode = 'v' })
end

function Graph:adjacent(x, y)
  local n1, n2 = false, false

  for _,v in pairs(self._nodes[x]) do
    if v == y then n1 = true end
  end

  for _,v in pairs(self._nodes[y]) do
    if v == x then n2 = true end
  end

  return (n1 and n2)
end

function Graph:neighbors(x)
  for _,v in pairs(self._nodes[x]) do
    print(v)
  end
end

function Graph:add(x, y)
  table.insert(self._nodes[x], y)
  table.insert(self._nodes[y], x)
end

function Graph:delete(x, y)
  for i,v in pairs(self._nodes[x]) do
    if v == y then
      table.remove(self._nodes[x])
    end
  end

  for i,v in pairs(self._nodes[y]) do
    if v == x then
      table.remove(self._nodes[y])
    end
  end
end

return Graph
