local connections = data.raw["space-connection"]
-- if not connections then return end

local setting = settings.startup["choosing-connections-to-keep"]
setting.value = setting.value:lower()
-- if not setting or setting.value == "" then return end

for entry in setting.value:gmatch("([^,]+)") do
  local name = entry:match("^%s*(.-)%s*$") -- trim whitespace
  if name ~= "" then
    local connection = connections[name]
    if connection then
      connection.redrawn_connections_keep = true
      log("Keeping redrawn space connection: " .. name)
    else
      log("Space connection not found: " .. name)
    end
  end
end

local space_locations = data.raw["space-location"]
local exclusions = settings.startup["planets-to-ignore"]

for entry in exclusions.value:gmatch("([^,]+)") do
  local name = entry:match("^%s*(.-)%s*$")
  if name ~= "" then
    local space_location = space_locations[name]
    if space_location then
      space_location.redrawn_connections_exclude=true
    else
      log("Space location not found: " .. name)
    end
  end
end

if mods["slp-dyson-sphere-reworked"] then 
  local sun = data.raw["space-location"]["slp-solar-system-sun"]
  local sun2 = data.raw["space-location"]["slp-solar-system-sun2"]
  local sun_settings = settings.startup["progression-fix-dyson-sphere"]
  if sun_settings.value == "Full" then
    sun.redrawn_connections_exclude=true
  end
  if sun_settings.value ~= "None" then
    sun2.redrawn_connections_exclude=true
  end
end