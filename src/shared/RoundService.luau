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

function RoundService:StartGame()
  --checks
  if RoundSettings.isGameInSession == true then 
    warn("game is still in session!") 
    return 
  end

  if not RoundServiceHelper:hasEnoughPlayers() then
    return 
  end

  RoundSettings.isGameInSession = true

end

function RoundService:EndGame()
  
end

function RoundService:Init()
  print("Init!")
  RoundSettings.isGameInSession = false
end
return RoundService
