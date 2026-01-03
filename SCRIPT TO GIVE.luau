print("LOADER STARTED")

--// The Forge Time License Loader

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local LICENSE_URL = "https://raw.githubusercontent.com/casualybrent/roblox-licenses/main/licenses.json"
local SCRIPT_URL = "https://raw.githubusercontent.com/XZuuyaX/TheForge/refs/heads/main/A%20F.luau"

local player = Players.LocalPlayer
local userId = tostring(player.UserId)

-- get current time automatically (NO time.is)
local function now()
    return DateTime.now().UnixTimestamp
end

-- get license list
local success, data = pcall(function()
    return HttpService:GetAsync(LICENSE_URL)
end)

if not success then
    warn("[Forge] License server error")
    return
end

local licenses = HttpService:JSONDecode(data)
local expireTime = licenses[userId]

-- check license
if not expireTime then
    warn("[Forge] No license")
    return
end

if now() >= expireTime then
    warn("[Forge] License expired")
    return
end

-- license valid → load The Forge
loadstring(game:HttpGet(SCRIPT_URL))()
