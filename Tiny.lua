Object={}Object.__index=Object
setmetatable(Object,Object)function Object:__call(...)return self:new(...)end
function Object:init()end
function Object:parent()return getmetatable(self)end
function Object:new(...)local e={}setmetatable(e,self)self.__index=self
self.__call=Object.__call
e:init(...)return e
end
