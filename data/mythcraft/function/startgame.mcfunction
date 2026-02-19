# Clear any lingering schedules from a previous game
schedule clear mythcraft:quests/startquest
schedule clear mythcraft:quests/endquest
schedule clear mythcraft:quests/timer
schedule clear mythcraft:quests/actionbar
schedule clear mythcraft:quests/nextquest_actionbar
schedule clear mythcraft:beginendgame
schedule clear mythcraft:endgame
schedule clear mythcraft:endgame_actionbar
schedule clear mythcraft:respawn/respawn_pass
schedule clear mythcraft:respawn/regen_check
schedule clear mythcraft:respawn/regen_tick
schedule clear mythcraft:respawn/regen_skill_tick
schedule clear mythcraft:raidboss/try_spawn
schedule clear mythcraft:raidboss/monitor
schedule clear mythcraft:raidboss/cleanup_splits
schedule clear mythcraft:raidboss/clear_transition_flag
schedule clear mythcraft:raidboss/spawn_loop
schedule clear mythcraft:respawn/grace_tick

# Reset victory points
scoreboard players set Team1 victoryPoints 0
scoreboard players set Team2 victoryPoints 0

# Reset skill XP and levels
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
scoreboard players set @a levelAttack 0
scoreboard players set @a levelDefense 0
scoreboard players set @a levelMagic 0
scoreboard players set @a levelSpecial 0

# Reset character XP and levels
scoreboard players reset * characterXP
scoreboard players reset * characterLevel
scoreboard players set @a characterXP 0
scoreboard players set @a characterLevel 1

# Reset quest buff timers
scoreboard players set @a BuffResistance 0
scoreboard players set @a BuffSpeed 0
scoreboard players set @a BuffHealthBoost 0
scoreboard players set @a BuffStrength 0

# Reset magic spell cooldowns
scoreboard players set @a magicSpellCooldown 0

# Reset quest history and quest state
data remove storage mythcraft:questhistory log
data modify storage mythcraft:questhistory log set value []

scoreboard players set Team1 questKills 0
scoreboard players set Team2 questKills 0
scoreboard players set QuestTracker questWinner -1
scoreboard players set QuestTracker questType 0
scoreboard players set QuestTracker questRewardType 0
scoreboard players set QuestTracker questReward 0
scoreboard players set QuestTracker questLocation 0
scoreboard players set QuestTracker endGame 0

# Reset grace period timers and clear any lingering invulnerability
scoreboard players set City1 graceTimer 0
scoreboard players set City2 graceTimer 0
scoreboard players set City3 graceTimer 0
scoreboard players set City4 graceTimer 0
scoreboard players set City5 graceTimer 0
scoreboard players set City6 graceTimer 0
scoreboard players set City7 graceTimer 0
execute as @e[tag=_gracePeriod] run data merge entity @s {Invulnerable:0b}
tag @e[tag=_gracePeriod] remove _gracePeriod

# Read quest counts from config
execute store result score QuestTracker victoryPointQuestsRemaining run data get storage mythcraft:config game.vpQuestCount
execute store result score QuestTracker questsRemaining run data get storage mythcraft:config game.questCount

# Refresh bossbar to show reset VP scores
data modify storage mythcraft:temp team1Name set from storage mythcraft:config teams.Team1.name
data modify storage mythcraft:temp team1Color set from storage mythcraft:config teams.Team1.color
data modify storage mythcraft:temp team2Name set from storage mythcraft:config teams.Team2.name
data modify storage mythcraft:temp team2Color set from storage mythcraft:config teams.Team2.color
function mythcraft:setup/bossbar with storage mythcraft:temp

title @a title {bold:true,color:"yellow",text:"Game Start"}
title @a subtitle {color:"light_purple",text:"Mythcraft Wars"}

# Initialize pre-game countdown timer from config (BEFORE announcements so scores are available)
execute store result score QuestTracker questTimer run data get storage mythcraft:config game.preGameDuration
scoreboard players operation QuestTracker questTimerMin = QuestTracker questTimer
scoreboard players operation QuestTracker questTimerMin /= C_60 mathCounter
scoreboard players operation QuestTracker questTimerSec = QuestTracker questTimer
scoreboard players operation QuestTracker questTimerSec %= C_60 mathCounter
schedule function mythcraft:quests/timer 1s
function mythcraft:quests/nextquest_actionbar

# Announce with dynamic timer
execute if score QuestTracker questTimerSec matches 10.. run tellraw @a [{bold:false,color:"light_purple",text:"Mythcraft Wars Start!\nQuests begin in "},{score:{name:"QuestTracker",objective:"questTimerMin"}},{text:":"},{score:{name:"QuestTracker",objective:"questTimerSec"}},{text:"."}]
execute if score QuestTracker questTimerSec matches ..9 run tellraw @a [{bold:false,color:"light_purple",text:"Mythcraft Wars Start!\nQuests begin in "},{score:{name:"QuestTracker",objective:"questTimerMin"}},{text:":0"},{score:{name:"QuestTracker",objective:"questTimerSec"}},{text:"."}]
execute as @a at @s run playsound ui.toast.challenge_complete master @s ~ ~ ~
execute if entity @a[tag=debugMode] run say [DEBUG] Game started

# Schedule first quest start from config
data modify storage mythcraft:temp duration set from storage mythcraft:config game.preGameDuration
function mythcraft:schedule/startquest with storage mythcraft:temp

# reset assassin totem charge
scoreboard players reset * totemCharge
scoreboard players set @a totemCharge 0

# reset bastion parry state
scoreboard players reset * parryWindow
scoreboard players reset * parryCooldown
scoreboard players reset * parryShieldProtect
scoreboard players reset * _shieldTick
scoreboard players reset * _wasBlocking
scoreboard players set @a parryWindow 0
scoreboard players set @a parryCooldown 0
scoreboard players set @a parryShieldProtect 0
scoreboard players set @a _shieldTick 0
scoreboard players set @a _wasBlocking 0

# reset bastion mortar state
function mythcraft:mortar/cleanup

# reset raid boss state and schedule spawn
kill @e[tag=raidBoss]
scoreboard players set RaidBoss raidBossState 0
scoreboard players set RaidBoss raidBossHP 0
scoreboard players set RaidBoss raidBossMaxHP 0
scoreboard players set RaidBoss raidBossLastHit 0
data modify storage mythcraft:raidboss recentTransition set value 0b
data modify storage mythcraft:raidboss spawnPending set value 0b
data modify storage mythcraft:raidboss rewardText set value ""
function mythcraft:raidboss/schedule_spawn

# reset city buff flags and recompute from config
function mythcraft:rewards/update_city_buffs

tag @a[team=Team1] add enableTroops
tag @a[team=Team2] add enableTroops

function mythcraft:respawn/init_counts
function mythcraft:respawn/respawn_pass
function mythcraft:respawn/regen_check
function mythcraft:respawn/regen_tick
function mythcraft:respawn/regen_skill_tick
function mythcraft:quests/buffloop
