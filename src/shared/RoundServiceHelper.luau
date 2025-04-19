local Players = game:GetService("Players")
local RoundSettings = require(script.Parent.RoundSettings)
local RoundServiceHelper = {}
print(script.Name .. " init!")
--get player list
local PlayerList = {}
--setup connections

function RoundServiceHelper:hasEnoughPlayers()
  if #Players:GetPlayers() >= RoundSettings.MinimumPlayersToStart then
    return true
  else
    return false
  end
end

function RoundServiceHelper:GetMaps()

end

function RoundServiceHelper:CleanUp()

end

function RoundServiceHelper:onPlayerDied()
  --make a connect for when a player dies, something will happen.
end

function RoundServiceHelper:assignTeam(plr : Player)

end

function RoundServiceHelper:addPlayer(plr : Player)
  if table.find(PlayerList, plr) then 
    warn(plr.Name .. " is already in the player list!")
    return
  else
    table.insert(PlayerList,plr)
  end
    print(PlayerList)
end

function RoundServiceHelper:removePlayer(plr : Player)
  print(plr.Name .. " left")
  if table.find(PlayerList, plr) then
    table.remove(PlayerList, table.find(PlayerList, plr))
  else
    warn(plr.Name .. " wasn't found in the table!")
  end
end

return RoundServiceHelper
