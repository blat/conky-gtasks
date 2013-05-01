gTasks plugin for Conky
===============

Allow you to display your gTasks todo-list in Conky.

Dependances
------------------

* lua
* lua-socket
* lua-ssl
* lua-json


Setup
------------------

1.  Download `gtasks.lua`

2.  In your `.conkyrc`, before `TEXT`, add:

        lua_load /path/to/gtasks.lua

3.  In your `.conkyrc`, after `TEXT, add:

        ${lua gtasks #USERNAME#@gmail.com #PASSWORD#}

4.  Run `conky`
