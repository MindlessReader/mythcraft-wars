schedule function mythcraft:endgame 300s

title @a title {bold:true,color:"#663399",text:"☠ Endgame ☠"}
title @a subtitle [{text:"GRACE PERIOD ABOLISHED",color:"dark_red"}]

tellraw @a {bold:true,color:"yellow",text:"Endgame has begun! The game will end in 5 minutes."}
tellraw @a [{text:"GRACE PERIOD ABOLISHED: Troops can be killed immediately after a city has been conquered.",color:"dark_red"}]

scoreboard players set QuestTracker endGame 1