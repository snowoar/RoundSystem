--!strict
type RoundSettings = {
  DefaultIntermissionTime : number,
  DefaultGameTime : number,
  MinimumPlayersToStart : number,
  isGameInSession : boolean,
  isGameEventsActive : boolean
}

local RoundSetting : RoundSettings = {
  DefaultIntermissionTime = 3,
  DefaultGameTime = 1,
  MinimumPlayersToStart = 1,
  isGameInSession = false,
  isGameEventsActive = false
}

return RoundSetting
