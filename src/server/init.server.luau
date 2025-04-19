local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RoundService = require(ReplicatedStorage.Shared.RoundService)

local function playerJoined(plr : Player)
  print(plr.Name)
  print(RoundService)
end

Players.PlayerAdded:Connect(playerJoined)
