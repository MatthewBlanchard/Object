Object = {}

-- Metamethods
function Object:__call(...)
    return self:new(...)
end

-- Constructor
function Object:__new()
end

-- Static Methods
function Object.__cast(o, m)
	setmetatable(o, m)
	m.__index = m
	m.__call = Object.__call

	return o
end

-- Methods
function Object:new(...)
    local o = {}
   	Object.__cast(o, self)

    o:__new(...)
    return o
end

Object = Object:new()