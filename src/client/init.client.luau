local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage.Shared.Remotes

local GameMessage = Remotes.GameMessage

local GameGui = Players.LocalPlayer.PlayerGui:WaitForChild("GameGui")

local oldPrio = 0
local currMsg = ""
GameMessage.OnClientEvent:Connect(function(msg : string, priority : number, duration : number)
    if priority > oldPrio then
        currMsg = msg
        print("new msg!")
    else
        --when the msg passes duration show the next message with highest priority
        
    end
end)
