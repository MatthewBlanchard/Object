#Object

A very simple OO library for Lua.

##Features

* Prototypical inheritence
* Constructors
* Lean codebase, smaller than any other object library I've seen.

```lua
Cat = Object()

-- Defaults
Cat.name = "A stray"

-- Constructor
function Cat:__new(name)
	self.name = name
end

-- Methods
function Cat:meow()
	print(self.name .. " meows!")
end

-- Usage
Merlin = Cat("Merlin")
Merlin:meow() -- "Merlin meows!"
```

##Usage

###Creating an object
To create an object:

```lua
Cat = Object() -- or
Cat = Object:new()
```
When you call new on an object it creates a new table, sets it's __index to the object it's being called on, and calls the constructor of said object (__new). Object has no concept of class definitions or instances. All objects are potentially prototypes for a new object. Instances are definitions by definition.


##License

MIT:

```
Copyright (c) 2012 Matthew R. Blanchard

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.```