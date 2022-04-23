local status, hyperModeAppMappings = pcall(require, 'hyperNew-apps')
local am = require('app-management')

function myLaunchOrFocus(appName)
   local app = hs.appfinder.appFromName(appName)
   if app == nil then
      hs.application.launchOrFocus(appName)
   else
      windows = app:allWindows()
      if windows[1] then
         windows[1]:focus()
      end
   end
end

for i, mapping in ipairs(hyperModeAppMappings) do
  local key = mapping[1]
  local app = mapping[2]
  hs.hotkey.bind({'shift', 'ctrl', 'alt', 'cmd'}, key, function()
    -- myLaunchOrFocus(app) -- opens only from the current desktop
    -- opens from all desktops
    if (type(app) == 'string') then
       hs.application.open(app)
     elseif (type(app) == 'function') then
       app()
     else
       hs.logger.new('hyper'):e('Invalid mapping for Hyper +', key)
     end
  end)
end


