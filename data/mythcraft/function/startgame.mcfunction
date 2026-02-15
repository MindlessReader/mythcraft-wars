# Clear any lingering schedules from a previous game
schedule clear mythcraft:quests/startquest
schedule clear mythcraft:quests/endquest
schedule clear mythcraft:quests/timer
schedule clear mythcraft:quests/actionbar
schedule clear mythcraft:quests/nextquest_actionbar
schedule clear mythcraft:beginendgame
schedule clear mythcraft:endgame
schedule clear mythcraft:endgame_actionbar

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

# Read quest counts from config
execute store result score QuestTracker victoryPointQuestsRemaining run data get storage mythcraft:config game.vpQuestCount
execute store result score QuestTracker questsRemaining run data get storage mythcraft:config game.questCount

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

# Schedule first quest start from config
data modify storage mythcraft:temp duration set from storage mythcraft:config game.preGameDuration
function mythcraft:schedule/startquest with storage mythcraft:temp

# reset assassin totem charge
scoreboard players reset * totemCharge
scoreboard players set @a totemCharge 0

tag @a[team=Team1] add enableTroops
tag @a[team=Team2] add enableTroops

function mythcraft:respawn/respawnchecker
function mythcraft:quests/buffloop
