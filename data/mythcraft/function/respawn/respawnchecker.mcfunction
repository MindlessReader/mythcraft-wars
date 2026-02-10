#function that runs every 3 minutes to check if troops need to be respawned
execute if score City1 cityConquerProgress matches 1.. if score City1 cityConquerProgress = City1LastChecked cityConquerProgress run function mythcraft:respawn/callback/city1
execute if score City2 cityConquerProgress matches 1.. if score City2 cityConquerProgress = City2LastChecked cityConquerProgress run function mythcraft:respawn/callback/city2
execute if score City3 cityConquerProgress matches 1.. if score City3 cityConquerProgress = City3LastChecked cityConquerProgress run function mythcraft:respawn/callback/city3
execute if score City4 cityConquerProgress matches 1.. if score City4 cityConquerProgress = City4LastChecked cityConquerProgress run function mythcraft:respawn/callback/city4
execute if score City5 cityConquerProgress matches 1.. if score City5 cityConquerProgress = City5LastChecked cityConquerProgress run function mythcraft:respawn/callback/city5
execute if score City6 cityConquerProgress matches 1.. if score City6 cityConquerProgress = City6LastChecked cityConquerProgress run function mythcraft:respawn/callback/city6
execute if score City7 cityConquerProgress matches 1.. if score City7 cityConquerProgress = City7LastChecked cityConquerProgress run function mythcraft:respawn/callback/city7

scoreboard players operation City1LastChecked cityConquerProgress = City1 cityConquerProgress
scoreboard players operation City2LastChecked cityConquerProgress = City2 cityConquerProgress
scoreboard players operation City3LastChecked cityConquerProgress = City3 cityConquerProgress
scoreboard players operation City4LastChecked cityConquerProgress = City4 cityConquerProgress
scoreboard players operation City5LastChecked cityConquerProgress = City5 cityConquerProgress
scoreboard players operation City6LastChecked cityConquerProgress = City6 cityConquerProgress
scoreboard players operation City7LastChecked cityConquerProgress = City7 cityConquerProgress

schedule function mythcraft:respawn/respawnchecker 180s