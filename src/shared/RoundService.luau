local Players = game:GetService("Players")

local function playerJoined(plr : Player)
  print(plr.Name)
end

Players.PlayerAdded:Connect(playerJoined)
