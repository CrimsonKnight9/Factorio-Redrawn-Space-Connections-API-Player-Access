local connections = data.raw["space-connection"]
if not connections then return end

local setting = settings.startup["choosing-connections-to-keep"]
setting.value = setting.value:lower()
if not setting or setting.value == "" then return end

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
