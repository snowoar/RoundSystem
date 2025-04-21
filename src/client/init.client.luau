local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage.Shared.Remotes

local GameMessage = Remotes.GameMessage

local GameGui : ScreenGui = Players.LocalPlayer.PlayerGui:WaitForChild("GameGui")

local oldPrio = 0
local currMsg = ""

local isMessageDisplayActive = false
local msgEvent = Instance.new("BindableEvent")
local messages : {
  [index] : {
    message : string,
    priority : "Urgent" | "Game" | "Casual"
  }
} = {}
messages.event = msgEvent

GameMessage.OnClientEvent:Connect(function(msg : string, priority : number, durationMsg : number?)
    -- if priority > oldPrio then
    --     currMsg = msg
    --     print("new msg!")
    -- else
    --     --when the msg passes duration show the next message with highest priority
    --
    -- end
    local duration = durationMsg or 3
    -- table.insert(messages)
    msgEvent:Fire(msg, priority, duration)

end)

msgEvent.Event:Connect(function(msg, priority, duration)
  print("msgevent binded")
  print(msg, priority, duration)
  if isMessageDisplayActive then
    print("dipslay is active")
    -- get duration until message can be seen
    --
    
  end
end)

GameGui.Enabled = true
