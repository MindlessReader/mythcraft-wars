# Clear pre-quest countdown display
schedule clear mythcraft:quests/nextquest_actionbar

#reset values from previous quest
scoreboard players set Team1 questKills 0
scoreboard players set Team2 questKills 0
scoreboard players set QuestTracker questWinner 0
scoreboard players set QuestTracker questType 0
scoreboard players set QuestTracker questRewardType 0
scoreboard players set QuestTracker questReward 0
scoreboard players set QuestTracker questLocation 0
scoreboard players set QuestTracker questLocationOwner 0

# Gets quest type, 1 = conquer, 2 = kill
execute store result score QuestTracker questType run function mythcraft:getrandomnumber {max:2}
execute if score QuestTracker questType matches 1 run data modify storage mythcraft:quest typeText set value "Conquer"
execute if score QuestTracker questType matches 2 run data modify storage mythcraft:quest typeText set value "Kill"

# If conquer, get city, 3-7 for cities (capitals excluded for fairness)
execute if score QuestTracker questType matches 1 store result score QuestTracker questLocation run function mythcraft:getrandomnumber {max:5}
execute if score QuestTracker questType matches 1 run scoreboard players add QuestTracker questLocation 2

# get current owner of city and set attacker and defender text
execute if score QuestTracker questType matches 1 store result storage mythcraft:getlocationowner id int 1 run scoreboard players get QuestTracker questLocation
execute if score QuestTracker questType matches 1 run data modify storage mythcraft:getlocationowner locationPath set value "QuestTracker questLocationOwner"
execute if score QuestTracker questType matches 1 run function mythcraft:lookup/cityownerbyid with storage mythcraft:getlocationowner

# If kill, get leveling location, 8 = Attack, 9 = Defense, 10 = Magic, 11 = Special
execute if score QuestTracker questType matches 2 store result score QuestTracker questLocation run function mythcraft:getrandomnumber {max:4}
execute if score QuestTracker questType matches 2 run scoreboard players add QuestTracker questLocation 7

# determine reward based on remaining victory point quests scheduled. victory point = 3, pool = 1
execute store result storage mythcraft:params/getrandomnumber max int 1 run scoreboard players get QuestTracker questsRemaining
execute store result score QuestTracker mathCounter run function mythcraft:getrandomnumber with storage mythcraft:params/getrandomnumber
execute if score QuestTracker mathCounter <= QuestTracker victoryPointQuestsRemaining run scoreboard players set QuestTracker questRewardType 3

# if not victory point reward, pick from configurable quest reward pool
execute unless score QuestTracker mathCounter <= QuestTracker victoryPointQuestsRemaining run scoreboard players set QuestTracker questRewardType 1
execute if score QuestTracker questRewardType matches 1 run data modify storage mythcraft:temp questPool set from storage mythcraft:config rewards.questPool
execute if score QuestTracker questRewardType matches 1 run function mythcraft:rewards/pick_quest_reward
execute if score QuestTracker questRewardType matches 3 run data modify storage mythcraft:quest rewardText set value "1 Victory Point"

# store location name
execute store result storage mythcraft:getlocation id int 1 run scoreboard players get QuestTracker questLocation
data modify storage mythcraft:getlocation locationPath set value "mythcraft:quest locationText"
function mythcraft:lookup/locationbyid with storage mythcraft:getlocation

# Initialize quest countdown timer from config (BEFORE announcements so scores are available)
execute store result score QuestTracker questTimer run data get storage mythcraft:config game.questDuration
scoreboard players operation QuestTracker questTimerMin = QuestTracker questTimer
scoreboard players operation QuestTracker questTimerMin /= C_60 mathCounter
scoreboard players operation QuestTracker questTimerSec = QuestTracker questTimer
scoreboard players operation QuestTracker questTimerSec %= C_60 mathCounter
schedule function mythcraft:quests/timer 1s

# announce and call relevant announcement function for detailed description
tellraw @a {bold:true,color:"#DDA0DD",text:"~~~~~~~~~~"}
tellraw @a [{nbt:"typeText",storage:"mythcraft:quest"},": ",{color:"red",nbt:"locationText",storage:"mythcraft:quest"},{text:"\nReward: "},{bold:true,color:"light_purple",nbt:"rewardText",storage:"mythcraft:quest"}]
execute if score QuestTracker questType matches 1 run function mythcraft:quests/announce/conquerquest
execute if score QuestTracker questType matches 2 run function mythcraft:quests/announce/killquest
tellraw @a {bold:true,color:"#DDA0DD",text:"~~~~~~~~~~"}
function mythcraft:debug/quest_start with storage mythcraft:quest

title @a title {bold:true,color:"#FFD700",text:"New Quest"}
title @a subtitle [{nbt:"typeText",storage:"mythcraft:quest"},": ",{color:"red",nbt:"locationText",storage:"mythcraft:quest"},{text:" / Reward: "},{bold:true,color:"light_purple",nbt:"rewardText",storage:"mythcraft:quest"}]

# start actionbar loop
function mythcraft:quests/actionbar

execute as @a at @s run playsound block.note_block.chime master @s ~ ~ ~

# Schedule end of quest from config
data modify storage mythcraft:temp duration set from storage mythcraft:config game.questDuration
function mythcraft:schedule/endquest with storage mythcraft:temp

# Raid boss: transition flag (15s safety window) + check if this quest triggers spawn
data modify storage mythcraft:raidboss recentTransition set value 1b
schedule function mythcraft:raidboss/clear_transition_flag 15s
function mythcraft:raidboss/check_spawn
