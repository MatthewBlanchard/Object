Object = {}

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

    local err = o:__init(...)
    return err or o
end

Object = Object:new()