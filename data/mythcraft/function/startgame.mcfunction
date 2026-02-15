title @a title {bold:true,color:"yellow",text:"Game Start"}
title @a subtitle {color:"#663399",text:"The Mythcraft 10 Year Anniversary Event has begun!"}
tellraw @a [{bold:false,color:"#663399",text:"The Mythcraft 10 Year Anniversary Event has begun!\nQuests begin in 5 minutes."}]
execute as @a at @s run playsound ui.toast.challenge_complete master @s ~ ~ ~

schedule function mythcraft:quests/startquest 300s

# Start "Next Quest" countdown for the pre-game wait
scoreboard players set QuestTracker questTimer 300
scoreboard players set QuestTracker questTimerMin 5
scoreboard players set QuestTracker questTimerSec 0
schedule function mythcraft:quests/timer 1s
function mythcraft:quests/nextquest_actionbar

tag @a[team=Team1] add enableTroops
tag @a[team=Team2] add enableTroops

function mythcraft:respawn/respawnchecker
function mythcraft:quests/buffloop