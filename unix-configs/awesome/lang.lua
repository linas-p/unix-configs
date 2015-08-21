local wibox = require("wibox")
local awful = require("awful")
local naughty = require("naughty")
local mouse = require("mouse")
-- Keyboard map indicator and changer
local lang = {}
lang.cmd = "setxkbmap"
lang.layout =  { "us", "lt" }
lang.current = 1  -- us is our default layout
lang.switch = function ()
	lang.current = lang.current + 1
	if lang.current > #lang.layout then
		lang.current = 1
	end

	local t = lang.layout[lang.current]
    os.execute( lang.cmd .. " " .. t )
    naughty.notify({title = 'Keyboard switched to:', text = t, timeout = 5, screen = mouse.screen})
end


return lang
