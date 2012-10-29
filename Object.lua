--[[
Copyright (c) 2012 Matthew R. Blanchard

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
-]]

Object = {}
Object.__index = Object
setmetatable(Object, Object)

-- Variables
Object.__metamethods =  {
    "__add", "__sub", "__mul", "__div", "__mod", "__pow", "__unm",
    "__len", "__lt", "__le", "__concat", "__tostring"
}

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

-- Private/Static methods
function Object:__metamethod(event)
    return function(...)
        if self:parent() == self then
            error(event .. " is unimplemented on object.", 2)
        end
        
        func = rawget(self, event) or rawget(self:parent(), event)
        if type(func) == "function" then return func(...) else return func end
    end
end

function Object:mixin(tomix)
    for k,v in pairs(tomix) do
        self[k] = v
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
    self.__newindex = Object.__newindex
    
    for k,v in pairs(Object.__metamethods) do
        o[v] = self:__metamethod(v)
    end
    
    o:__init(...)
    return o
end
