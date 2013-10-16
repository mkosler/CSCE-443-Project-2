local Graph = {}
Graph.__index = Graph

function Graph:new(width, height)
  return setmetatable({
    _nodes = {},
  }, self)
end

function Graph:createNode(o)
  self._nodes[o] = { _neighbors = {} }
end

function Graph:adjacent(x, y)
  local n1, n2 = false, false

  for _,v in pairs(x.neighbors) do
    if v == y then n1 = true end
  end

  for _,v in pairs(y.neighbors) do
    if v == x then n2 = true end
  end

  return (n1 and n2)
end

function Graph:neighbors(x)
  for _,v in pairs(x.neighbors) do
    print(v)
  end
end

function Graph:add(x, y)
  table.insert(self._nodes[x]._neighbors, self._nodes[y])
  table.insert(self._nodes[y]._neighbors, self._nodes[x])
end

function Graph:delete(x, y)
  for i,v in pairs(self._nodes[x]._neighbors) do
    if v == y then
      table.remove(self._nodes[x]._neighbors, i)
    end
  end

  for i,v in pairs(self._nodes[y]._neighbors) do
    if v == x then
      table.remove(self._nodes[y]._neighbors, i)
    end
  end
end

return Graph
