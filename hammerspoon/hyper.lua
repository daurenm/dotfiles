local This = {}

-- Hyper mode needs to be bound to a key. Here we are binding
-- it to F17, because this is yet another key that's unused.
-- Why not F18? We will use key-events from F18 to turn hyper
-- mode on and off. Using F17 as both the modal and source of key
-- events will result in a very jittery Hyper mode.
This.hyperMode = hs.hotkey.modal.new({}, 'F17')

-- Enter Hyper Mode when Hyper-key is pressed
function enterHyperMode()
   This.hyperMode:enter()
end

-- Leave Hyper Mode when Hyper-key is pressed
function exitHyperMode()
   This.hyperMode:exit()
end

-- Utility to bind handler to Hyper+key
function This.bindKey(key, handler)
    This.hyperMode:bind({}, key, handler)
end

-- Utility to bind handler to Hyper+Shift+key
function This.bindShiftKey(key, handler)
   This.hyperMode:bind({'shift'}, key, handler)
end

-- Utility to bind handler to Hyper+Command+Shift+key
function This.bindCommandShiftKey(key, handler)
  This.hyperMode:bind({'command', 'shift'}, key, handler)
end

-- Utility to bind handler to Hyper+modifiers+key
function This.bindKeyWithModifiers(key, mods, handler)
   This.hyperMode:bind(mods, key, handler)
end

-- Binds the enter/exit functions of the Hyper modal to all
-- combinations of modifiers
function This.install(hotKey)
  hs.hotkey.bind({}, hotKey, enterHyperMode, exitHyperMode)
  hs.hotkey.bind({"shift"}, hotKey, enterHyperMode, exitHyperMode)
  hs.hotkey.bind({"ctrl"}, hotKey, enterHyperMode, exitHyperMode)
  hs.hotkey.bind({"ctrl", "shift"}, hotKey, enterHyperMode,
    exitHyperMode)
  hs.hotkey.bind({"cmd"}, hotKey, enterHyperMode, exitHyperMode)
  hs.hotkey.bind({"cmd", "shift"}, hotKey, enterHyperMode, 
    exitHyperMode)
  hs.hotkey.bind({"cmd", "ctrl"}, hotKey, enterHyperMode, 
    exitHyperMode)
  hs.hotkey.bind({"cmd", "ctrl", "shift"}, hotKey, enterHyperMode, 
    exitHyperMode)
  hs.hotkey.bind({"alt"}, hotKey, enterHyperMode, exitHyperMode)
  hs.hotkey.bind({"alt", "shift"}, hotKey, enterHyperMode, 
    exitHyperMode)
  hs.hotkey.bind({"alt", "ctrl"}, hotKey, enterHyperMode, 
    exitHyperMode)
  hs.hotkey.bind({"alt", "ctrl", "shift"}, hotKey, enterHyperMode, 
    exitHyperMode)
  hs.hotkey.bind({"alt", "cmd"}, hotKey, enterHyperMode, 
    exitHyperMode)
  hs.hotkey.bind({"alt", "cmd", "shift"}, hotKey, enterHyperMode, 
    exitHyperMode)
  hs.hotkey.bind({"alt", "cmd", "ctrl"}, hotKey, enterHyperMode, 
    exitHyperMode)
  hs.hotkey.bind({"alt", "cmd", "shift", "ctrl"}, hotKey, 
    enterHyperMode, exitHyperMode)
end

return This
