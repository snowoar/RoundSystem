local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage.Shared.Remotes

local GameMessage = Remotes.GameMessage

GameMessage.OnClientEvent:Connect(function(msg : string)
    print(msg)
end)
