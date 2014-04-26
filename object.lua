Object = {}

-- Variables
Object.__metamethods =  {
    "__add", "__sub", "__mul", "__div", "__mod", "__pow", "__unm",
    "__len", "__lt", "__le", "__concat", "__tostring"
}

-- Metamethods
function Object:__call(...)
    return self:new(...)
end

-- Constructor
function Object:__new()
end

-- Private/Static methods
function Object:__metamethod(event)
    return function(...)
        func = self[event]
        
        if type(func) == "function" then 
            return func(...) 
        else
            return func
        end
    end
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
    
    for k,v in pairs(Object.__metamethods) do
        o[v] = self:__metamethod(v)
    end
    
    local err = o:__new(...)
    return err or o
end

Object = Object:new()