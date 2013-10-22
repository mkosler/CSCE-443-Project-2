--- Set the _object table to be a weak key table, so this does not
-- prevent garbage collection from occuring
local _objects = setmetatable({}, { __mode = 'k' })

--- Add an object to the manager
-- @param o Object to add to the manager
local function add(o)
  _objects[o] = true
end

--- Remove an object from the manager
-- @param o Object to remove from the manager
local function remove(o)
  _objects[o] = nil
end

--- Removes all objects from the manager
local function clear()
  for o,_ in pairs(_objects) do
    remove(o)
  end
  _objects = setmetatable({}, { __mode = 'k' })
end

--- Calls a given function (or name of a function that the objects have)
-- across all objects in the manager
-- @param f Function to be called. If f is a function, it will be applied to all objects
-- in the manager; if f is a string, then it will be applied only to objects that have a function
-- named f in their table
-- @param ... The additional arguments for the function that is to be mapped
local function map(f, ...)
  for o,_ in pairs(_objects) do
    if type(f) == 'function' then
      f(o, ...)
    elseif type(f) == 'string' then
      if o[f] then o[f](o, ...) end
    end
  end
end

return {
  add = add,
  remove = remove,
  clear = clear,
  map = map,
}
