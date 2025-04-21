local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Teams = game:GetService("Teams")
local RoundSettings = require(ReplicatedStorage.Shared.Settings.RoundSettings)
local GameMessage = ReplicatedStorage.Shared.Remotes.GameMessage
local RoundServiceHelper = {}
--get player list
local PlayerList : {Player} = {}
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

function RoundServiceHelper:MessagePlayer(plr : Player, msg : string, priority, duration : number)
  GameMessage:FireClient(plr, msg, priority, duration)
end

function RoundServiceHelper:MessageAllPlayer(msg : string, priorty, duration : number)
  GameMessage:FireAllClients(msg, priorty, duration)
end

function RoundServiceHelper:GetMaps()

end

function RoundServiceHelper:GetMostVotedMap(data)
    
end

function RoundServiceHelper:CleanUp()
  for _, team in Teams:GetTeams() do
    RoundServiceHelper:destroyTeam(team)
  end
end

function RoundServiceHelper:onPlayerDied()
  --make a connect for when a player dies, something will happen.
end

function RoundServiceHelper:getTeamWithLowestPlayers(): Team
  local lowestTeam : Team
  for i, team in pairs(Teams:GetTeams()) do
    if i == 1 then
      lowestTeam = team
    end

    if #team:GetPlayers() < #lowestTeam:GetPlayers() then
      lowestTeam = team
    end
  end
  return lowestTeam
end

function RoundServiceHelper:assignTeam(plr : Player, team : Team)
  plr.Team = team or findTeamFromName(team)
end

function RoundServiceHelper:assignAllRandomTeamEven()
    for i, plr : Player in PlayerList do
      plr.Team = RoundServiceHelper:getTeamWithLowestPlayers()
      print(plr.Name .. " is assigned to: ", plr.Team.Name)
      RoundServiceHelper:MessagePlayer(plr, "you are on team: " .. plr.Team.Name, 3, 3)
    end
end

function RoundServiceHelper:createTeam(teamName : string, color : BrickColor)
    local newTeam = Instance.new("Team")
    newTeam.TeamColor = color
    newTeam.Name = teamName
    newTeam.Parent = Teams
end

function RoundServiceHelper:destroyTeam(team : Team, fallbackTeam : string)
  for _,plr in team:GetPlayers() do
    plr.Team = nil
  end
  team:Destroy()
end

function RoundServiceHelper:getRandomGamemode()

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
