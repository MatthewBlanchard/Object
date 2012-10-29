require "Object"

Cat = Object() -- Or Object:new(), Object() is just a shortcut.

function Cat:__tostring()
    return "A " .. self.breed .. " cat"
end

function Cat:Cat() -- New supported syntax for defining constructors.
    self.breed = "mixed" -- Could also do just "Cat.breed = 'blah'" outside function scope.
end


Siamese = Cat()

function Siamese:Siamese()
    self.breed = "Siamese"
end

Bill = Cat()
Phil = Siamese()

print(Bill, Phil)
