local altHyper = {"alt"}
local altCtrlHyper = {"alt", "ctrl"}
local altCtrlCmdHyper = {"alt", "ctrl", "cmd"}

hs.window.animationDuration = 0

require("hs.application")
require("hs.window")

-----------------------------------------------
-- Hyper j for fullscreen
-----------------------------------------------
hs.hotkey.bind(altHyper, "j", function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x
	f.y = max.y
	f.w = max.w
	f.h = max.h
	win:setFrame(f)
end)

-----------------------------------------------
-- Hyper h for left one half window
-----------------------------------------------

hs.hotkey.bind(altHyper, "h", function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x
	f.y = max.y
	f.w = max.w / 2
	f.h = max.h
	win:setFrame(f)
end)

-----------------------------------------------
-- Hyper l for right one half window
-----------------------------------------------
hs.hotkey.bind(altHyper, "l", function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x + (max.w / 2)
	f.y = max.y
	f.w = max.w / 2
	f.h = max.h
	win:setFrame(f)
end)

-----------------------------------------------
-- Hyper y for top left one quarter window
-----------------------------------------------
hs.hotkey.bind(altHyper, "y", function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x
	f.y = max.y
	f.w = max.w / 2
	f.h = max.h / 2
	win:setFrame(f)
end)

-----------------------------------------------
-- Hyper o for top right one quarter window
-----------------------------------------------
hs.hotkey.bind(altHyper, "o", function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x + (max.w / 2)
	f.y = max.y
	f.w = max.w / 2
	f.h = max.h / 2
	win:setFrame(f)
end)


-----------------------------------------------
-- Hyper . for bottom right one quarter window
-----------------------------------------------
hs.hotkey.bind(altHyper, ".", function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x + (max.w / 2)
	f.y = max.y + (max.h / 2)
	f.w = max.w / 2
	f.h = max.h / 2
	win:setFrame(f)
end)

-----------------------------------------------
-- Hyper n for bottom left one quarter window
-----------------------------------------------
hs.hotkey.bind(altHyper, "n", function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x
	f.y = max.y + (max.h / 2)
	f.w = max.w / 2
	f.h = max.h / 2
	win:setFrame(f)
end)


resizeLeft = function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	f.x = f.x - 32
	win:setFrame(f)
end

resizeRight = function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	f.x = f.x + 32
	win:setFrame(f)
end

resizeBottom = function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	f.y = f.y + 32
	f.h = f.h + 32
	win:setFrame(f)
end

resizeTop = function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	f.y = f.y - 32
	f.h = f.h - 32
	win:setFrame(f)
end

hs.hotkey.bind(altCtrlHyper, "h", resizeLeft, nil, resizeLeft)
hs.hotkey.bind(altCtrlHyper, "l", resizeRight, nil, resizeRight)
hs.hotkey.bind(altCtrlHyper, "j", resizeBottom, nil, resizeBottom)
hs.hotkey.bind(altCtrlHyper, "k", resizeTop, nil, resizeTop)


increaseBottom = function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	f.h = f.h + 64
	win:setFrame(f)
end

decreaseBottom = function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	f.h = f.h - 32
	win:setFrame(f)
end

increaseLeft = function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	f.w = f.w + 32
	win:setFrame(f)
end

decreaseLeft = function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	f.w = f.w - 32
	win:setFrame(f)
end

hs.hotkey.bind(altCtrlCmdHyper, "j", increaseBottom, nil, increaseBottom)
hs.hotkey.bind(altCtrlCmdHyper, "k", decreaseBottom, nil, decreaseBottom)
hs.hotkey.bind(altCtrlCmdHyper, "l", increaseLeft, nil, increaseLeft)
hs.hotkey.bind(altCtrlCmdHyper, "h", decreaseLeft, nil, decreaseLeft)


-- Applications
hs.hotkey.bind(altHyper, "space", function()
	os.execute("open /Applications/iTerm.app")
end)
