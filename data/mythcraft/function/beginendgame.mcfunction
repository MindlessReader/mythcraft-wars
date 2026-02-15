# Clear any remaining quest display loops
schedule clear mythcraft:quests/actionbar
schedule clear mythcraft:quests/nextquest_actionbar
schedule clear mythcraft:quests/timer

schedule function mythcraft:endgame 300s

# Initialize endgame countdown timer (reuses quest timer scoreboards)
scoreboard players set QuestTracker questTimer 300
scoreboard players set QuestTracker questTimerMin 5
scoreboard players set QuestTracker questTimerSec 0
schedule function mythcraft:quests/timer 1s
function mythcraft:endgame_actionbar

title @a title {bold:true,color:"#663399",text:"☠ Endgame ☠"}
title @a subtitle [{text:"GRACE PERIOD ABOLISHED",color:"dark_red"}]

tellraw @a {bold:true,color:"yellow",text:"Endgame has begun! The game will end in 5 minutes."}
tellraw @a [{text:"GRACE PERIOD ABOLISHED: Troops can be killed immediately after a city has been conquered.",color:"dark_red"}]

scoreboard players set QuestTracker endGame 1