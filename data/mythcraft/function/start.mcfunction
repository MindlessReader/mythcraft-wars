say starting!
# load world config defaults (only on first run — dialog edits persist across reloads)
execute unless data storage mythcraft:config cities run function mythcraft:config
# initialize teleport coordinates if missing (for worlds created before this feature)
execute unless data storage mythcraft:config cities.City1.teleport run function mythcraft:config/init_teleports
# initialize game timing config if missing (for worlds created before this feature)
execute unless data storage mythcraft:config game run function mythcraft:config/init_game

# add teams
team add Team1
team add Team2
team add Unaligned

function mythcraft:setup/configteam with storage mythcraft:config teams.Team1
function mythcraft:setup/configteam with storage mythcraft:config teams.Team2
team modify Unaligned color yellow

bossbar add mythcraft:victorypointsbar "Victory Points"
bossbar set mythcraft:victorypointsbar visible true
bossbar set mythcraft:victorypointsbar style progress
data modify storage mythcraft:temp team1Name set from storage mythcraft:config teams.Team1.name
data modify storage mythcraft:temp team1Color set from storage mythcraft:config teams.Team1.color
data modify storage mythcraft:temp team2Name set from storage mythcraft:config teams.Team2.name
data modify storage mythcraft:temp team2Color set from storage mythcraft:config teams.Team2.color
function mythcraft:setup/bossbar with storage mythcraft:temp
execute as @a run bossbar set mythcraft:victorypointsbar players @s
# statistics scoreboards
scoreboard objectives add totalGameDeaths deathCount
scoreboard objectives add totalGameKills totalKillCount
scoreboard objectives add totalGamePlayerKills playerKillCount
scoreboard objectives add citiesConquered dummy

# add and set victory point scoreboards
scoreboard objectives add victoryPoints dummy
scoreboard objectives modify victoryPoints displayname "Victory Points"

scoreboard players set Team1 victoryPoints 0
scoreboard players set Team2 victoryPoints 0

# add location id scoreboard
scoreboard objectives add locationId dummy

# add city scoreboards
scoreboard objectives add cityOwnership dummy
scoreboard objectives add cityConquerProgress dummy
scoreboard objectives add cityConquerValue dummy

# set city IDs
scoreboard players set City1 locationId 1
scoreboard players set City2 locationId 2
scoreboard players set City3 locationId 3
scoreboard players set City4 locationId 4
scoreboard players set City5 locationId 5
scoreboard players set City6 locationId 6
scoreboard players set City7 locationId 7
# set city ownership
scoreboard players set City1 cityOwnership 0
scoreboard players set City2 cityOwnership 0
scoreboard players set City3 cityOwnership 0
scoreboard players set City4 cityOwnership 0
scoreboard players set City5 cityOwnership 0
scoreboard players set City6 cityOwnership 0
scoreboard players set City7 cityOwnership 0
# set conquer progress
scoreboard players set City1 cityConquerProgress 0
scoreboard players set City2 cityConquerProgress 0
scoreboard players set City3 cityConquerProgress 0
scoreboard players set City4 cityConquerProgress 0
scoreboard players set City5 cityConquerProgress 0
scoreboard players set City6 cityConquerProgress 0
scoreboard players set City7 cityConquerProgress 0
# set needed conquer value (same as number of markers and troops in that city)
#scoreboard players set City1 cityConquerValue 3
#scoreboard players set City2 cityConquerValue 3
#scoreboard players set City3 cityConquerValue 1
#scoreboard players set City4 cityConquerValue 1
#scoreboard players set City5 cityConquerValue 1
#scoreboard players set City6 cityConquerValue 1
#scoreboard players set City7 cityConquerValue 1
# set last checked conquer progress
scoreboard players set City1LastChecked cityConquerProgress 0
scoreboard players set City2LastChecked cityConquerProgress 0
scoreboard players set City3LastChecked cityConquerProgress 0
scoreboard players set City4LastChecked cityConquerProgress 0
scoreboard players set City5LastChecked cityConquerProgress 0
scoreboard players set City6LastChecked cityConquerProgress 0
scoreboard players set City7LastChecked cityConquerProgress 0

# add team xp and levels
scoreboard objectives add xpAttack dummy
scoreboard objectives add levelAttack dummy
scoreboard objectives add xpDefense dummy
scoreboard objectives add levelDefense dummy
scoreboard objectives add xpMagic dummy
scoreboard objectives add levelMagic dummy
scoreboard objectives add xpSpecial dummy
scoreboard objectives add levelSpecial dummy
scoreboard objectives add xpThresholds dummy

# set character xp thresholds
#scoreboard players set CharLvl2 characterXPThresholds 15
#scoreboard players set CharLvl3 characterXPThresholds 30
#scoreboard players set CharLvl4 characterXPThresholds 50
#scoreboard players set CharLvl5 characterXPThresholds 80

# set skill xp thresholds
#scoreboard players set Threshold1 xpThresholds 40
#scoreboard players set Threshold2 xpThresholds 100
#scoreboard players set Threshold3 xpThresholds 180
#scoreboard players set Threshold4 xpThresholds 310
#scoreboard players set Threshold5 xpThresholds 500

# set location IDs
scoreboard players set Attack locationId 8
scoreboard players set Defense locationId 9
scoreboard players set Magic locationId 10
scoreboard players set Special locationId 11

# reset all skill levels and xp (includes offline players)
scoreboard players reset * xpAttack
scoreboard players reset * xpDefense
scoreboard players reset * xpMagic
scoreboard players reset * xpSpecial
scoreboard players reset * levelAttack
scoreboard players reset * levelDefense
scoreboard players reset * levelMagic
scoreboard players reset * levelSpecial

# set xp and levels for teams
scoreboard players set Team1 xpAttack 0
scoreboard players set Team1 xpDefense 0
scoreboard players set Team1 xpMagic 0
scoreboard players set Team1 xpSpecial 0
scoreboard players set Team1 levelAttack 0
scoreboard players set Team1 levelDefense 0
scoreboard players set Team1 levelMagic 0
scoreboard players set Team1 levelSpecial 0

scoreboard players set Team2 xpAttack 0
scoreboard players set Team2 xpDefense 0
scoreboard players set Team2 xpMagic 0
scoreboard players set Team2 xpSpecial 0
scoreboard players set Team2 levelAttack 0
scoreboard players set Team2 levelDefense 0
scoreboard players set Team2 levelMagic 0
scoreboard players set Team2 levelSpecial 0

# set player levels for online players
scoreboard players set @a levelAttack 0
scoreboard players set @a levelDefense 0
scoreboard players set @a levelMagic 0
scoreboard players set @a levelSpecial 0

# misc scoreboards
scoreboard objectives add needsRekit deathCount
scoreboard objectives add mathCounter dummy
scoreboard objectives add endGame dummy

# class system
scoreboard objectives add playerClass dummy
scoreboard objectives add selectClass trigger

# player menu triggers
scoreboard objectives add openMenu trigger
scoreboard objectives add teleportLocation trigger

# character leveling (per-player progression)
scoreboard objectives add characterXP dummy
scoreboard objectives add characterLevel dummy
scoreboard objectives add characterXPThresholds dummy
scoreboard objectives add characterXPReward dummy
scoreboard objectives add _prevCharLevel dummy

# assassin totem charge (per-player, persists through death)
scoreboard objectives add totemCharge dummy
scoreboard objectives add totemCooldown dummy
scoreboard objectives add _totemMax dummy
scoreboard objectives add _totemDmg dummy
scoreboard objectives add totemInvisTimer dummy

# tunable XP-per-kill values (fake players, adjustable on the fly)
scoreboard players set TroopKill characterXPReward 1
scoreboard players set PlayerKill characterXPReward 3

# skill XP rewards (team-level progression at skill locations)
scoreboard objectives add skillXPReward dummy
scoreboard objectives add _prevSkillLevel dummy

# tunable XP-per-kill values for skill locations (fake players, adjustable on the fly)
scoreboard players set TroopKill skillXPReward 1

# reset all players
scoreboard players reset * characterXP
scoreboard players reset * characterLevel
scoreboard players set @a characterXP 0
scoreboard players set @a characterLevel 1
scoreboard players reset * totemCharge
scoreboard players set @a totemCharge 0

scoreboard players set QuestTracker endGame 0

# set constants
scoreboard players set C_0 mathCounter 0
scoreboard players set C_60 mathCounter 60

# quests
scoreboard objectives add questKills dummy
scoreboard objectives add questWinner dummy
scoreboard objectives add questType dummy
scoreboard objectives add questRewardType dummy
scoreboard objectives add questReward dummy
scoreboard objectives add questLocation dummy
scoreboard objectives add questTimer dummy
scoreboard objectives add questTimerMin dummy
scoreboard objectives add questTimerSec dummy
scoreboard objectives add questLocationOwner dummy
scoreboard objectives add victoryPointQuestsRemaining dummy
scoreboard objectives add questsRemaining dummy

scoreboard players set Team1 questKills 0
scoreboard players set Team2 questKills 0

# quest history
data remove storage mythcraft:questhistory log
data modify storage mythcraft:questhistory log set value []

scoreboard players set QuestTracker questWinner -1
scoreboard players set QuestTracker questType 0
scoreboard players set QuestTracker questRewardType 0
scoreboard players set QuestTracker questReward 0
scoreboard players set QuestTracker questLocation 0

execute store result score QuestTracker victoryPointQuestsRemaining run data get storage mythcraft:config game.vpQuestCount
execute store result score QuestTracker questsRemaining run data get storage mythcraft:config game.questCount
scoreboard players set QuestTracker questTimer 0
scoreboard players set QuestTracker questTimerMin 0
scoreboard players set QuestTracker questTimerSec 0

# buff time remaining
scoreboard objectives add BuffResistance dummy
scoreboard objectives add BuffSpeed dummy
scoreboard objectives add BuffHealthBoost dummy
scoreboard objectives add BuffStrength dummy

# rng scoreboards
scoreboard objectives add RNG_Constant dummy
scoreboard objectives add RNG_Variable dummy
scoreboard players set C_1000 RNG_Constant 1000
scoreboard players set C_314159 RNG_Constant 314159
scoreboard players set C_2718281 RNG_Constant 2718281
scoreboard players set RNGseed RNG_Variable 0

#Spell Timer
scoreboard objectives add SpellBreathCooldown dummy
scoreboard objectives add SpellBreathLifetime dummy

# Display
scoreboard objectives add display dummy
scoreboard objectives modify display displayname "Cities"
scoreboard objectives setdisplay sidebar display
scoreboard objectives modify display numberformat blank
#scoreboard objectives setdisplay list victoryPoints

# Sidebar display names are set dynamically from config
scoreboard players reset * display
function mythcraft:setup/sidebar_city {cityId:City1, displayScore:-2}
function mythcraft:setup/sidebar_city {cityId:City2, displayScore:-3}
function mythcraft:setup/sidebar_city {cityId:City3, displayScore:-4}
function mythcraft:setup/sidebar_city {cityId:City4, displayScore:-5}
function mythcraft:setup/sidebar_city {cityId:City5, displayScore:-6}
function mythcraft:setup/sidebar_city {cityId:City6, displayScore:-7}
function mythcraft:setup/sidebar_city {cityId:City7, displayScore:-8}

# TESTING AREA      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# thresholds
scoreboard players set City1 cityConquerValue 3
scoreboard players set City2 cityConquerValue 3
scoreboard players set City3 cityConquerValue 1
scoreboard players set City4 cityConquerValue 1
scoreboard players set City5 cityConquerValue 1
scoreboard players set City6 cityConquerValue 1
scoreboard players set City7 cityConquerValue 1

# set xp thresholds (temporary for testing)
scoreboard players set Threshold1 xpThresholds 1
scoreboard players set Threshold2 xpThresholds 2
scoreboard players set Threshold3 xpThresholds 4
scoreboard players set Threshold4 xpThresholds 6
scoreboard players set Threshold5 xpThresholds 8

# character level thresholds (temporary for testing)
scoreboard players set CharLvl2 characterXPThresholds 2
scoreboard players set CharLvl3 characterXPThresholds 4
scoreboard players set CharLvl4 characterXPThresholds 6
scoreboard players set CharLvl5 characterXPThresholds 8

#respawn all for testing
function mythcraft:respawn/masterspawn

# run rekit for testing
execute as MindlessReader run function mythcraft:rekit

#testing
advancement revoke @a everything
## TESTING AREA END ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
