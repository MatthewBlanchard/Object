#Object

A very simple object system for Lua, less than 320 bytes.

##Features

Tinyobj:

* Prototyping (inheritence)
* Constructors
* Lean codebase, smaller than any other object library I've seen.

Object:

* Prototyping
* Constructors + fancy syntax for definition
* Metamethod inheritence
* Low performance and code footprint


##Usage

###Creating an object
To create an object:

```lua
Cat = Object()
```

or

```lua
Cat = Object:new()
```

###Inheritance
Assuming the Cat variable still exists:

```lua
Siamese = Cat()
```

or

```lua
Siamese = Cat:new()
```

Inheritence is the same as creating an object. The object you call new on becomes the prototype for the new object.

###Differences from other object libraries

Object has no concept of a class or instance. Any object can become the prototype for another object. I personally feel this is more Luaey then shoving the concept of classes into Lua. This particular library was somewhat inspired by my short experience with Javascript, so it's paradigm is similar I think, but without all the javascript nasties. Let me show you a few things class libraries can't do.

Let's create a predamaged enemy prototype:
```lua
dEnemy = Enemy()

function dEnemy:dEnemy() -- Or dEnemy:init(), whichever you like tinyobj only supports init()
  dEnemy:damage(10)
  dEnemy:remove("larm")
end

Bill = dEnemy() -- BAM!
```

Now Bill is using the damaged enemy as a prototype and will be damaged. If you were making a zombie game you could do this so you could specifically spawn damaged/destroyed zombies or something. 


##License

MIT:

```
Copyright (c) 2012 Matthew R. Blanchard

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.```