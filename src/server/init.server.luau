local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RoundService = require(ReplicatedStorage.Shared.RoundService)
local RoundServiceHelper = require(ReplicatedStorage.Shared.RoundServiceHelper)


local function playerJoined(plr : Player)
    print(plr.Name)
    RoundServiceHelper:addPlayer(plr)
end

local function playerLeaving(plr : Player)
    RoundServiceHelper:removePlayer(plr)
end

-- intermission
-- check # of player
--
game.Loaded:Connect(RoundService:Init())

Players.PlayerAdded:Connect(playerJoined)
Players.PlayerRemoving:Connect(playerLeaving)
