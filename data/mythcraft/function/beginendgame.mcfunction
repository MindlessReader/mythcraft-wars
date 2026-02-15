# Clear any remaining quest display loops
schedule clear mythcraft:quests/actionbar
schedule clear mythcraft:quests/nextquest_actionbar
schedule clear mythcraft:quests/timer

# Schedule endgame from config
data modify storage mythcraft:temp duration set from storage mythcraft:config game.endgameDuration
function mythcraft:schedule/endgame with storage mythcraft:temp

# Initialize endgame countdown timer from config (reuses quest timer scoreboards)
execute store result score QuestTracker questTimer run data get storage mythcraft:config game.endgameDuration
scoreboard players operation QuestTracker questTimerMin = QuestTracker questTimer
scoreboard players operation QuestTracker questTimerMin /= C_60 mathCounter
scoreboard players operation QuestTracker questTimerSec = QuestTracker questTimer
scoreboard players operation QuestTracker questTimerSec %= C_60 mathCounter
schedule function mythcraft:quests/timer 1s
function mythcraft:endgame_actionbar

title @a title {bold:true,color:"light_purple",text:"☠ Endgame ☠"}
title @a subtitle [{text:"GRACE PERIOD ABOLISHED",color:"dark_red"}]

# Announce with dynamic timer
execute if score QuestTracker questTimerSec matches 10.. run tellraw @a [{bold:true,color:"yellow",text:"Endgame has begun! The game will end in "},{score:{name:"QuestTracker",objective:"questTimerMin"}},{text:":"},{score:{name:"QuestTracker",objective:"questTimerSec"}},{text:"."}]
execute if score QuestTracker questTimerSec matches ..9 run tellraw @a [{bold:true,color:"yellow",text:"Endgame has begun! The game will end in "},{score:{name:"QuestTracker",objective:"questTimerMin"}},{text:":0"},{score:{name:"QuestTracker",objective:"questTimerSec"}},{text:"."}]
tellraw @a [{text:"GRACE PERIOD ABOLISHED: Troops can be killed immediately after a city has been conquered.",color:"dark_red"}]

scoreboard players set QuestTracker endGame 1