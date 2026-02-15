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

# determine reward based on remaining victory point quests scheduled. victory point = 3, buff = 2, item = 1
execute store result storage mythcraft:params/getrandomnumber max int 1 run scoreboard players get QuestTracker questsRemaining
execute store result score QuestTracker mathCounter run function mythcraft:getrandomnumber with storage mythcraft:params/getrandomnumber
execute if score QuestTracker mathCounter <= QuestTracker victoryPointQuestsRemaining run scoreboard players set QuestTracker questRewardType 3

# if not victory point reward, choose from other 2 at random
execute unless score QuestTracker mathCounter <= QuestTracker victoryPointQuestsRemaining store result score QuestTracker questRewardType run function mythcraft:getrandomnumber {max:2}

# generate which questReward will be given from buff list or item list, or set to victory point reward
execute if score QuestTracker questRewardType matches 1 run function mythcraft:quests/rewards/generate/item
execute if score QuestTracker questRewardType matches 2 run function mythcraft:quests/rewards/generate/buff
execute if score QuestTracker questRewardType matches 3 run data modify storage mythcraft:quest rewardText set value "1 Victory Point"

# store location name
execute store result storage mythcraft:getlocation id int 1 run scoreboard players get QuestTracker questLocation
data modify storage mythcraft:getlocation locationPath set value "mythcraft:quest locationText"
function mythcraft:lookup/locationbyid with storage mythcraft:getlocation

# announce and call relevant announcement function for detailed description
tellraw @a {bold:true,color:"#DDA0DD",text:"~~~~~~~~~~"}
tellraw @a [{nbt:"typeText",storage:"mythcraft:quest"},": ",{color:"red",nbt:"locationText",storage:"mythcraft:quest"},{text:"\nReward: "},{bold:true,color:"#663399",nbt:"rewardText",storage:"mythcraft:quest"}]
execute if score QuestTracker questType matches 1 run function mythcraft:quests/announce/conquerquest
execute if score QuestTracker questType matches 2 run function mythcraft:quests/announce/killquest
tellraw @a {bold:true,color:"#DDA0DD",text:"~~~~~~~~~~"}

title @a title {bold:true,color:"#FFD700",text:"New Quest"}
title @a subtitle [{nbt:"typeText",storage:"mythcraft:quest"},": ",{color:"red",nbt:"locationText",storage:"mythcraft:quest"},{text:" / Reward: "},{bold:true,color:"#663399",nbt:"rewardText",storage:"mythcraft:quest"}]

# start quest countdown timer
scoreboard players set QuestTracker questTimer 300
scoreboard players set QuestTracker questTimerMin 5
scoreboard players set QuestTracker questTimerSec 0
schedule function mythcraft:quests/timer 1s

# start actionbar loop
function mythcraft:quests/actionbar


execute as @a at @s run playsound block.note_block.chime master @s ~ ~ ~

#schedule end of quest
schedule function mythcraft:quests/endquest 300s