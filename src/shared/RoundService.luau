--local Players = game:GetService("Players")

local RoundServiceHelper = require(script.Parent.RoundServiceHelper)
local RoundSettings = require(script.Parent.RoundSettings)
local RoundService = {}

--how the game works
--intermission
--game 
--clean up
--repeat 
--
--
--checks:
--hasEnoughPlayers
--isGameInSession
--
function RoundService:StartIntermission()
  task.wait(3)
end

function RoundService:StartGame()
  --checks
  if RoundSettings.isGameInSession == true then 
    warn("game is still in session!") 
    return 
  end

  if not RoundServiceHelper:hasEnoughPlayers() then
    print("not enough players to start game...")
    return 
  end

  RoundSettings.isGameInSession = true
  RoundSettings.isGameEventsActive = true

  print("game starting...")

  --intermission
  --
  
  RoundServiceHelper:createTeam("test", BrickColor.new("Really red"))  
  RoundServiceHelper:assignAllRandomTeam()
end

function RoundService:EndGame()
  
end

function RoundService:Init()
  print("Init!")
  RoundSettings.isGameInSession = false
  RoundSettings.isGameEventsActive = false
  RoundService:StartGame()
end

return RoundService
