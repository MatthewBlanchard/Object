local z,_s={},setmetatable
_s(z,z)function z.__call(s, ...)return s:new(...)end
function z:init()end
function z.parent()return getmetatable(s)end
function z.new(s,...)local o=_s({},s)s.__index,s.__call=s,Object.__call
o:init(...)return o
end
Object=z
