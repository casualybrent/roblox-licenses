local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local userId = tostring(player.UserId)

-- Put your RAW URLs here
local LICENSE_URL = "https://raw.githubusercontent.com/casualybrent/roblox-licenses/refs/heads/main/licenses.json?token=GHSAT0AAAAAADSLTCKBPULP3VUANVUYOLG62KY5ZNQ"
local MAIN_URL = "https://raw.githubusercontent.com/casualybrent/roblox-licenses/refs/heads/main/main.lua?token=GHSAT0AAAAAADSLTCKBVSBDIGFK6EYV5WFW2KY5ZYA"

-- Fetch license data
local data = game:HttpGet(LICENSE_URL)
local licenses = HttpService:JSONDecode(data)

-- Check access
if not licenses[userId] or not licenses[userId].enabled then
    error("No access")
end

-- Load main script
loadstring(game:HttpGet(MAIN_URL))()
