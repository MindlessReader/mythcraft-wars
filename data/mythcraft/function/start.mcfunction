say Initializing Mythcraft Wars...
# load world config defaults (only on first run — dialog edits persist across reloads)
execute unless data storage mythcraft:config cities run function mythcraft:config
# initialize teleport coordinates if missing (for worlds created before this feature)
execute unless data storage mythcraft:config cities.City1.teleport run function mythcraft:config/init_teleports
# initialize game timing config if missing (for worlds created before this feature)
execute unless data storage mythcraft:config game run function mythcraft:config/init_game
# initialize troop config if missing (for worlds created before dynamic spawn system)
execute unless data storage mythcraft:config cities.City1.troopCap run function mythcraft:config/init_troops
execute unless data storage mythcraft:config game.regenCheckInterval run function mythcraft:config/init_regen
# add boss support to skill locations (for worlds created before this feature)
execute unless data storage mythcraft:config skillLocations.Attack.bossPool run function mythcraft:config/init_skill_boss
# initialize reward config if missing (for worlds created before configurable rewards)
execute unless data storage mythcraft:config rewards run function mythcraft:config/init_rewards
# initialize raid boss config if missing (for worlds created before raid boss feature)
execute unless data storage mythcraft:config cities.City1.raidBossPool run function mythcraft:config/init_raidboss
# initialize grace period duration if missing (for worlds created before configurable grace period)
execute unless data storage mythcraft:config game.gracePeriodDuration run data modify storage mythcraft:config game.gracePeriodDuration set value 60
# initialize XP threshold config if missing (for worlds created before configurable XP thresholds)
execute unless data storage mythcraft:config xp run function mythcraft:config/init_xp

# initialize display name lookups (runs every load)
function mythcraft:rewards/init_names
function mythcraft:raidboss/init_names

# initialize raid boss flags
data modify storage mythcraft:raidboss recentTransition set value 0b
data modify storage mythcraft:raidboss spawnPending set value 0b

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

# dynamic troop system scoreboards
scoreboard objectives add troopCount dummy
scoreboard objectives add bossCount dummy
scoreboard objectives add troopCap dummy
scoreboard objectives add bossCap dummy
scoreboard objectives add troopCountLastChecked dummy
scoreboard objectives add bossCountLastChecked dummy
scoreboard objectives add regenActive dummy

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
# (cityConquerProgress/cityConquerValue no longer used — dynamic troop system uses troopCount/bossCount)

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

# sync XP thresholds from config into scoreboards
function mythcraft:config/sync_xp

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

# admin menu
scoreboard objectives add adminAction trigger
scoreboard objectives add markerCount dummy "Marker Counts"

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
scoreboard objectives add stealthTimer dummy

# bastion parry
scoreboard objectives add parryShieldProtect dummy
scoreboard objectives add _shieldTick dummy
scoreboard objectives add _wasBlocking dummy
scoreboard objectives add parryWindow dummy
scoreboard objectives add parryCooldown dummy

# bastion mortar shot
scoreboard objectives add mortarCooldown dummy
scoreboard objectives add _crossbowLoaded dummy
scoreboard objectives add _mortarLoaded dummy
scoreboard objectives add mortarCharLevel dummy
scoreboard objectives add mortarFieldLife dummy

# troop indicator (XP bar shows nearby city troop count)
scoreboard objectives add _troopTotal dummy
scoreboard objectives add _troopCap dummy
scoreboard objectives add _xpFill dummy

# raid boss
scoreboard objectives add raidBossHP dummy
scoreboard objectives add raidBossMaxHP dummy
scoreboard objectives add raidBossState dummy
scoreboard objectives add raidBossLastHit dummy
scoreboard objectives add cleanupTimer dummy

# grace period (invulnerability timer per city after conquest)
scoreboard objectives add graceTimer dummy

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

# clean up mortar entities and scores
function mythcraft:mortar/cleanup

# clean up fireball burn tags
tag @e remove _fireballBurn
tag @e remove _fbTeam1
tag @e remove _fbTeam2

scoreboard players set QuestTracker endGame 0

# set constants
scoreboard players set C_0 mathCounter 0
scoreboard players set C_2 mathCounter 2
scoreboard players set C_3 mathCounter 3
scoreboard players set C_4 mathCounter 4
scoreboard players set C_20 mathCounter 20
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

# buff time remaining (quest rewards)
scoreboard objectives add BuffResistance dummy
scoreboard objectives add BuffSpeed dummy
scoreboard objectives add BuffHealthBoost dummy
scoreboard objectives add BuffStrength dummy

# city ownership buff flags (permanent while team owns a city with the buff)
scoreboard objectives add CityBuffResistance dummy
scoreboard objectives add CityBuffSpeed dummy
scoreboard objectives add CityBuffHealthBoost dummy
scoreboard objectives add CityBuffStrength dummy

# rng scoreboards
scoreboard objectives add RNG_Constant dummy
scoreboard objectives add RNG_Variable dummy
scoreboard players set C_1000 RNG_Constant 1000
scoreboard players set C_314159 RNG_Constant 314159
scoreboard players set C_2718281 RNG_Constant 2718281
scoreboard players set RNGseed RNG_Variable 0

#Magic Spell System (generic for all magic spells)
scoreboard objectives add magicSpellCooldown dummy
scoreboard objectives add _spellLifetime dummy
scoreboard objectives add _fbBurnTimer dummy
scoreboard objectives add _fbSubTick dummy

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

# Start respawn/regen loops (run always, not just during game)
schedule clear mythcraft:respawn/respawn_pass
schedule clear mythcraft:respawn/regen_check
schedule clear mythcraft:respawn/regen_tick
schedule clear mythcraft:respawn/regen_skill_tick
schedule clear mythcraft:respawn/grace_tick

# Restart grace tick loop if any timers are active (handles reload mid-grace)
execute if score City1 graceTimer matches 1.. run schedule function mythcraft:respawn/grace_tick 1s
execute if score City2 graceTimer matches 1.. run schedule function mythcraft:respawn/grace_tick 1s
execute if score City3 graceTimer matches 1.. run schedule function mythcraft:respawn/grace_tick 1s
execute if score City4 graceTimer matches 1.. run schedule function mythcraft:respawn/grace_tick 1s
execute if score City5 graceTimer matches 1.. run schedule function mythcraft:respawn/grace_tick 1s
execute if score City6 graceTimer matches 1.. run schedule function mythcraft:respawn/grace_tick 1s
execute if score City7 graceTimer matches 1.. run schedule function mythcraft:respawn/grace_tick 1s

function mythcraft:respawn/init_counts
function mythcraft:respawn/respawn_pass
function mythcraft:respawn/regen_check
function mythcraft:respawn/regen_tick
function mythcraft:respawn/regen_skill_tick

# TESTING AREA      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# set xp thresholds (temporary for testing) KEEP IN MIND THIS DOESNT UPDATE THE CONFIG VALUES, JUST THE SCOREBOARD VALUES USED FOR LEVELING
#scoreboard players set Threshold1 xpThresholds 1
#scoreboard players set Threshold2 xpThresholds 2
#scoreboard players set Threshold3 xpThresholds 4
#scoreboard players set Threshold4 xpThresholds 6
#scoreboard players set Threshold5 xpThresholds 8

# character level thresholds (temporary for testing)
#scoreboard players set CharLvl2 characterXPThresholds 2
#scoreboard players set CharLvl3 characterXPThresholds 4
#scoreboard players set CharLvl4 characterXPThresholds 6
#scoreboard players set CharLvl5 characterXPThresholds 8

#respawn all for testing
#function mythcraft:respawn/masterspawn

# run rekit for testing
#execute as MindlessReader run function mythcraft:rekit

#testing
#advancement revoke @a everything
## TESTING AREA END ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
say Initialized.