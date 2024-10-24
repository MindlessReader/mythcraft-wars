say starting!
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
scoreboard objectives add citiesConquered dummy

# add and set victory point scoreboards
scoreboard objectives add victoryPoints dummy
scoreboard objectives modify victoryPoints displayname "Victory Points"

scoreboard players set Druids victoryPoints 0
scoreboard players set Royals victoryPoints 0

# add location id scoreboard
scoreboard objectives add locationId dummy

# add city scoreboards
scoreboard objectives add cityOwnership dummy
scoreboard objectives add cityConquerProgress dummy
scoreboard objectives add cityConquerValue dummy

# set city IDs
scoreboard players set Celak locationId 1
scoreboard players set Kings-Port locationId 2
scoreboard players set Athens locationId 3
scoreboard players set Delphi locationId 4
scoreboard players set Povertane locationId 5
scoreboard players set Amnis locationId 6
scoreboard players set Fronteria locationId 7
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
scoreboard objectives add xpFort-Reference dummy
scoreboard objectives add levelFort-Reference dummy
scoreboard objectives add xpThoth-University dummy
scoreboard objectives add levelThoth-University dummy
scoreboard objectives add xpAthena-Library dummy
scoreboard objectives add levelAthena-Library dummy
scoreboard objectives add xpThresholds dummy

# set xp thresholds
scoreboard players set Threshold1 xpThresholds 40
scoreboard players set Threshold2 xpThresholds 100
scoreboard players set Threshold3 xpThresholds 180
scoreboard players set Threshold4 xpThresholds 310
scoreboard players set Threshold5 xpThresholds 500

# set xp thresholds (temporary for testing)
scoreboard players set Threshold1 xpThresholds 1
scoreboard players set Threshold2 xpThresholds 2
scoreboard players set Threshold3 xpThresholds 3
scoreboard players set Threshold4 xpThresholds 4
scoreboard players set Threshold5 xpThresholds 5

# set location IDs
scoreboard players set Colosseum locationId 8
scoreboard players set Fort-Reference locationId 9
scoreboard players set Thoth-University locationId 10
scoreboard players set Athena-Library locationId 11

# set xp and levels for teams
scoreboard players set Druids xpColosseum 0
scoreboard players set Druids xpFort-Reference 0
scoreboard players set Druids xpThoth-University 0
scoreboard players set Druids xpAthena-Library 0
scoreboard players set Druids levelColosseum 0
scoreboard players set Druids levelFort-Reference 0
scoreboard players set Druids levelThoth-University 0
scoreboard players set Druids levelAthena-Library 0

scoreboard players set Royals xpColosseum 0
scoreboard players set Royals xpFort-Reference 0
scoreboard players set Royals xpThoth-University 0
scoreboard players set Royals xpAthena-Library 0
scoreboard players set Royals levelColosseum 0
scoreboard players set Royals levelFort-Reference 0
scoreboard players set Royals levelThoth-University 0
scoreboard players set Royals levelAthena-Library 0

# reset player levels
scoreboard players set @a levelColosseum 0
scoreboard players set @a levelFort-Reference 0
scoreboard players set @a levelThoth-University 0
scoreboard players set @a levelAthena-Library 0

# misc scoreboards
scoreboard objectives add needsRekit deathCount
scoreboard objectives add mathCounter dummy
scoreboard objectives add endGame dummy

scoreboard players set QuestTracker endGame 0

# set constants
scoreboard players set C_0 mathCounter 0

# quests
scoreboard objectives add questKills dummy
scoreboard objectives add questWinner dummy
scoreboard objectives add questType dummy
scoreboard objectives add questRewardType dummy
scoreboard objectives add questReward dummy
scoreboard objectives add questLocation dummy
scoreboard objectives add questLocationOwner dummy
scoreboard objectives add victoryPointQuestsRemaining dummy
scoreboard objectives add questsRemaining dummy

scoreboard players set Druids questKills 0
scoreboard players set Royals questKills 0

scoreboard players set QuestTracker questWinner 0
scoreboard players set QuestTracker questType 0
scoreboard players set QuestTracker questRewardType 0
scoreboard players set QuestTracker questReward 0
scoreboard players set QuestTracker questLocation 0

scoreboard players set QuestTracker victoryPointQuestsRemaining 6
scoreboard players set QuestTracker questsRemaining 10

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

# TESTING AREA      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#respawn all for testing
function mythcraft:respawn/masterspawn

# run rekit for testing
execute as MindlessReader run function mythcraft:rekit

#testing
advancement revoke @a everything
## TESTING AREA END ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# start loops
function mythcraft:respawn/respawnchecker
function mythcraft:quests/buffloop
function mythcraft:quests/actionbar
