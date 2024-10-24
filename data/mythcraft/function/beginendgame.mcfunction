schedule function mythcraft:endgame 300s

title @a title {"bold":true,"color":"yellow","text":"Endgame has begun!"}
title @a subtitle [{"text":"Troops can now be killed even immediately after a city has been conquered","color":"dark_purple"}]

tellraw @a {"bold":true,"color":"yellow","text":"Endgame has begun! The game will end in 5 minutes."}
tellraw @a [{"text":"Troops can now be killed even immediately after a city has been conquered.","color":"dark_purple"}]

scoreboard players set QuestTracker endGame 1