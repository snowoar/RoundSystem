local Players = game:GetService("Players")
local RoundSettings = require(script.Parent.RoundSettings)

local function playerJoined(plr : Player)
  print(plr.Name)
  print(RoundSettings)
end

Players.PlayerAdded:Connect(playerJoined)
