local altHyper = {"alt"}
local altCtrlHyper = {"alt", "ctrl"}
local altCtrlCmdHyper = {"alt", "ctrl", "cmd"}

hs.window.animationDuration = 0

require("hs.application")
require("hs.window")

hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.use_syncinstall = true

-- Window manipulation
spoon.SpoonInstall:andUse("WinWin", {
	fn = function(s)
		hs.hotkey.bind(altHyper, "j", function() s:moveAndResize("maximize") end)
		hs.hotkey.bind(altHyper, "h", function() s:moveAndResize("halfleft") end)
		hs.hotkey.bind(altHyper, "l", function() s:moveAndResize("halfright") end)
		hs.hotkey.bind(altHyper, "y", function() s:moveAndResize("cornerNW") end)
		hs.hotkey.bind(altHyper, "o", function() s:moveAndResize("cornerNE") end)
		hs.hotkey.bind(altHyper, ".", function() s:moveAndResize("cornerSE") end)
		hs.hotkey.bind(altHyper, "n", function() s:moveAndResize("cornerSW") end)

		hs.hotkey.bind(altCtrlHyper, "j", function() s:stepResize("down") end)
		hs.hotkey.bind(altCtrlHyper, "k", function() s:stepResize("up") end)
		hs.hotkey.bind(altCtrlHyper, "h", function() s:stepResize("left") end)
		hs.hotkey.bind(altCtrlHyper, "l", function() s:stepResize("right") end)

		hs.hotkey.bind(altCtrlCmdHyper, "j", function() s:stepMove("down") end)
		hs.hotkey.bind(altCtrlCmdHyper, "k", function() s:stepMove("up") end)
		hs.hotkey.bind(altCtrlCmdHyper, "h", function() s:stepMove("left") end)
		hs.hotkey.bind(altCtrlCmdHyper, "l", function() s:stepMove("right") end)
	end
})

-- Watch config for changes and reload when they occur
spoon.SpoonInstall:andUse("ReloadConfiguration", {
	start = true,
	fn = function()
		hs.notify.new({title="Hammerspoon", informativeText="Config reloaded"}):send()
	end
})

-- Pluggable launch bar
spoon.SpoonInstall:andUse("Seal", {
	hotkeys = {
		toggle = { {"cmd"}, "space" },
	},
	fn = function(s)
		s:loadPlugins({"apps", "calc", "screencapture", "pasteboard"})
	end,
	start = true,
})

-- Applications
hs.hotkey.bind(altHyper, "space", function()
	os.execute("open /Applications/iTerm.app")
end)


hs.hotkey.bind({"alt"}, "m", function()
	text = hs.window.frontmostWindow():title()
	key  = ""
	if string.match(text, "Amazon Web Services") then
		key = "Amazon Web Services"
	elseif string.match(text, "GitHub") then
		key = "Github"
	elseif string.match(text, "Binance") then
		key = "Binance"
	else
		print(text)
		hs.notify.new({title="Page Not Found", informativeText=text}):send()
		return
	end
	hs.notify.new({title="Hammerspoon", informativeText="Config reloaded"}):send()
	cmd = string.format("/opt/homebrew/bin/ykman oath accounts code -s '%s'", key)
	token = hs.execute(cmd)
	hs.notify.new({title=key, informativeText=token}):send()
	hs.eventtap.keyStrokes(token:gsub("\n", ""))
	hs.eventtap.keyStroke({}, "return" )
end)
