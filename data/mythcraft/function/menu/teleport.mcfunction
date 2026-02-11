# Handle teleport trigger — route to correct location coordinates
# Values 1-7 = cities, 8-11 = skill locations

# Cities
execute if score @s teleportLocation matches 1 run data modify storage mythcraft:temp tp set from storage mythcraft:config cities.City1.teleport
execute if score @s teleportLocation matches 2 run data modify storage mythcraft:temp tp set from storage mythcraft:config cities.City2.teleport
execute if score @s teleportLocation matches 3 run data modify storage mythcraft:temp tp set from storage mythcraft:config cities.City3.teleport
execute if score @s teleportLocation matches 4 run data modify storage mythcraft:temp tp set from storage mythcraft:config cities.City4.teleport
execute if score @s teleportLocation matches 5 run data modify storage mythcraft:temp tp set from storage mythcraft:config cities.City5.teleport
execute if score @s teleportLocation matches 6 run data modify storage mythcraft:temp tp set from storage mythcraft:config cities.City6.teleport
execute if score @s teleportLocation matches 7 run data modify storage mythcraft:temp tp set from storage mythcraft:config cities.City7.teleport

# Skill locations
execute if score @s teleportLocation matches 8 run data modify storage mythcraft:temp tp set from storage mythcraft:config skillLocations.Attack.teleport
execute if score @s teleportLocation matches 9 run data modify storage mythcraft:temp tp set from storage mythcraft:config skillLocations.Defense.teleport
execute if score @s teleportLocation matches 10 run data modify storage mythcraft:temp tp set from storage mythcraft:config skillLocations.Magic.teleport
execute if score @s teleportLocation matches 11 run data modify storage mythcraft:temp tp set from storage mythcraft:config skillLocations.Special.teleport

# Execute teleport
function mythcraft:menu/doteleport with storage mythcraft:temp tp

# Reset trigger
scoreboard players set @s teleportLocation 0
