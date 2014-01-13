Object = {}

-- Metamethods
function Object:__call(...)
    return self:new(...)
end

function Object:__newindex(k, v)
    if k == "init" or getfenv(2)[k] == self then
        rawset(self, "__init", v)
    else
        rawset(self, k, v)
    end
end

-- Constructor
function Object:__init()
end

-- Methods
function Object:parent()
    return getmetatable(self)
end

function Object:new(...)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    self.__call = Object.__call
    self.__newindex = Object.__newindex

    local err = o:__init(...)
    return err or o
end

Object = Object:new()