conky-gtasks
===============
Allow you to display your gTasks todo-list in Conky.

setup
------------------
depends on: lua, lua-socket, lua-ssl, lua-json

1.  download **gtasks.lua**
2.  in your **.conkyrc**, before **TEXT**, add:
        lua_load /path/to/gtasks.lua
3.  in your **.conkyrc**, after **TEXT**, add:
        ${lua gtasks #USERNAME#@gmail.com #PASSWORD#}
4.  run **conky**

mit licence
------------------
Copyright (c) 2010 Mickael BLATIERE

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

