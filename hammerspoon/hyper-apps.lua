local hyper = require('hyper')
local am = require('app-management')

local hyperModeAppMappings = {
  f = "com.apple.finder",
  t = "io.alacritty",
  b = "com.google.Chrome",
  x = "com.apple.dt.Xcode",
  i = "com.apple.iphonesimulator",
  c = "com.tinyspeck.slackmacgap",
  n = "notion.id",
  m = "com.hey.app.desktop",
  s = "com.spotify.client"
};

for key, app in pairs(hyperModeAppMappings) do
  hyper.bindKey(key, function() am.switchToAndFromApp(app) end)
end

-- Show and copy the bundleID of the currently open window
hyper.bindKey('/', function() 
    local bundleId = hs.window.focusedWindow():application():bundleID()
    hs.pasteboard.setContents(bundleId)
    hs.notify.new({ title="Hammerspoon", informativeText="Copies BundleID of the current app", withdrawAfter=3 }):send()
end)

