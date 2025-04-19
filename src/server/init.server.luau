local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RoundService = require(ReplicatedStorage.Shared.RoundService)
local RoundServiceHelper = require(ReplicatedStorage.Shared.RoundServiceHelper)


local function playerJoined(plr : Player)
    RoundServiceHelper:addPlayer(plr)
    RoundService:StartGame()
end

local function playerLeaving(plr : Player)
    RoundServiceHelper:removePlayer(plr)
end

-- intermission
-- check # of player
--
Players.PlayerAdded:Connect(playerJoined)
Players.PlayerRemoving:Connect(playerLeaving)

RoundService:Init()
