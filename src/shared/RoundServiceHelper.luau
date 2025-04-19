local Players = game:GetService("Players")
local Teams = game:GetService("Teams")
local RoundSettings = require(script.Parent.RoundSettings)
local RoundServiceHelper = {}
--get player list
local PlayerList = {}
--setup connections

local function findTeamFromName(teamName : string): Team
  for _, team in pairs(Teams:GetTeams()) do
    if team.Name == teamName then
      return team
    end
  end
  return nil
end

function RoundServiceHelper:hasEnoughPlayers()
  if #Players:GetPlayers() >= RoundSettings.MinimumPlayersToStart then
    return true
  else
    return false
  end
end

function RoundServiceHelper:GetMaps()

end

function RoundServiceHelper:GetMostVotedMap(data)
    
end

function RoundServiceHelper:CleanUp()

end

function RoundServiceHelper:onPlayerDied()
  --make a connect for when a player dies, something will happen.
end

function RoundServiceHelper:assignTeam(plr : Player, team : Team)
  plr.Team = team or findTeamFromName(team)
end

function RoundServiceHelper:assignAllRandomTeam()
    print(#Teams:GetTeams())
end

function RoundServiceHelper:createTeam(teamName : string, color : BrickColor)
    local newTeam = Instance.new("Team")
    newTeam.TeamColor = color
    newTeam.Name = teamName
    newTeam.Parent = Teams
end


function RoundServiceHelper:destroyTeam(teamName: string, fallbackTeam : string)
  local team = findTeamFromName(teamName)
  for _,plr in team:GetPlayers() do
    plr.Team = nil
  end
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
