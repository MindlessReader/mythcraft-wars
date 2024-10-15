# add teams
team add Druids
team add Royals
team add Unaligned

team modify Druids color green
team modify Royals color blue

team modify Druids seeFriendlyInvisibles true
team modify Royals seeFriendlyInvisibles true

team modify Druids friendlyFire false
team modify Royals friendlyFire false

# statistics scoreboards
scoreboard objectives add totalGameDeaths deathCount
scoreboard objectives add totalGameKills totalKillCount
scoreboard objectives add totalGamePlayerKills playerKillCount

# add and set victory point scoreboards
scoreboard objectives add victoryPoints dummy
scoreboard objectives modify victoryPoints displayname "Victory Points"

scoreboard players set Druids victoryPoints 0
scoreboard players set Royals victoryPoints 0

# add city scoreboards
scoreboard objectives add cityOwnership dummy
scoreboard objectives add cityConquerProgress dummy
scoreboard objectives add cityConquerValue dummy
# set city ownership
scoreboard players set Celak cityOwnership 0
scoreboard players set Kings-Port cityOwnership 0
scoreboard players set Athens cityOwnership 0
scoreboard players set Delphi cityOwnership 0
scoreboard players set Povertane cityOwnership 0
scoreboard players set Amnis cityOwnership 0
scoreboard players set Fronteria cityOwnership 0
# set conquer progress
scoreboard players set Celak cityConquerProgress 0
scoreboard players set Kings-Port cityConquerProgress 0
scoreboard players set Athens cityConquerProgress 0
scoreboard players set Delphi cityConquerProgress 0
scoreboard players set Povertane cityConquerProgress 0
scoreboard players set Amnis cityConquerProgress 0
scoreboard players set Fronteria cityConquerProgress 0
# set needed conquer value (same as number of markers and troops in that city)
scoreboard players set Celak cityConquerValue 3
scoreboard players set Kings-Port cityConquerValue 3
scoreboard players set Athens cityConquerValue 1
scoreboard players set Delphi cityConquerValue 1
scoreboard players set Povertane cityConquerValue 1
scoreboard players set Amnis cityConquerValue 1
scoreboard players set Fronteria cityConquerValue 1
# set last checked conquer progress
scoreboard players set CelakLastChecked cityConquerProgress 0
scoreboard players set Kings-PortLastChecked cityConquerProgress 0
scoreboard players set AthensLastChecked cityConquerProgress 0
scoreboard players set DelphiLastChecked cityConquerProgress 0
scoreboard players set PovertaneLastChecked cityConquerProgress 0
scoreboard players set AmnisLastChecked cityConquerProgress 0
scoreboard players set FronteriaLastChecked cityConquerProgress 0

# add team xp and levels
scoreboard objectives add xpColosseum dummy
scoreboard objectives add levelColosseum dummy
scoreboard objectives add xpFortReference dummy
scoreboard objectives add levelFortReference dummy
scoreboard objectives add xpThothUniversity dummy
scoreboard objectives add levelThothUniversity dummy
scoreboard objectives add xpAthenaLibrary dummy
scoreboard objectives add levelAthenaLibrary dummy

#set xp and levels for teams
scoreboard players set Druids xpColosseum 0
scoreboard players set Druids xpFortReference 0
scoreboard players set Druids xpThothUniversity 0
scoreboard players set Druids xpAthenaLibrary 0
scoreboard players set Druids levelColosseum 0
scoreboard players set Druids levelFortReference 0
scoreboard players set Druids levelThothUniversity 0
scoreboard players set Druids levelAthenaLibrary 0

scoreboard players set Royals xpColosseum 0
scoreboard players set Royals xpFortReference 0
scoreboard players set Royals xpThothUniversity 0
scoreboard players set Royals xpAthenaLibrary 0
scoreboard players set Royals levelColosseum 0
scoreboard players set Royals levelFortReference 0
scoreboard players set Royals levelThothUniversity 0
scoreboard players set Royals levelAthenaLibrary 0

# misc scoreboards
scoreboard objectives add needsRekit deathCount
scoreboard objectives add mathCounter dummy

#respawn all for testing
function mythcraft:respawn/masterspawn