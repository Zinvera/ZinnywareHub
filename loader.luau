local Players = game:GetService("Players")
local lp = Players.LocalPlayer

local REPO = "https://raw.githubusercontent.com/Zinvera/ZinnywareHub/main/"

local byPlace = {
    [137228775845999] = "ZinnywareGhost.lua",
}

local file = byPlace[game.PlaceId]
if not file then
    return lp:Kick("This game is not supported by Zinnyware!")
end

local ok, src = pcall(function() return game:HttpGet(REPO .. file) end)
if not ok or type(src) ~= "string" or src == "" then
    return lp:Kick("Zinnyware: couldn't fetch " .. file .. ".")
end

local fn, err = loadstring(src)
if not fn then
    return lp:Kick("Zinnyware: error in " .. file .. " - " .. tostring(err))
end
fn()
