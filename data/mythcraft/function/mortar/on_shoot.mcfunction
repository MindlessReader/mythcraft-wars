# Revoke advancement for reuse
advancement revoke @s only mythcraft:item/mortar_shoot

# Only process if Bastion and mortar was loaded
execute unless score @s playerClass matches 3 run return fail
execute unless score @s _mortarLoaded matches 1 run return fail

# Tag nearest firework_rocket entity and copy team tag
execute at @s run tag @e[type=firework_rocket,limit=1,sort=nearest,distance=..5] add mortarProjectile
execute as @s[team=Team1] at @s run tag @e[tag=mortarProjectile,limit=1,sort=nearest,distance=..5] add Team1
execute as @s[team=Team2] at @s run tag @e[tag=mortarProjectile,limit=1,sort=nearest,distance=..5] add Team2

# Summon tracker marker at player position and copy team + character level
execute at @s run summon marker ~ ~1.6 ~ {Tags:["mortarTracker","newMortarTracker"]}
execute as @s[team=Team1] run tag @e[tag=newMortarTracker,limit=1] add Team1
execute as @s[team=Team2] run tag @e[tag=newMortarTracker,limit=1] add Team2
scoreboard players operation @e[tag=newMortarTracker,limit=1] mortarCharLevel = @s characterLevel

# Give tracker a unique ID matching its firework (using global counter for true uniqueness)
scoreboard players add #MortarIDCounter mathCounter 1
scoreboard players operation @e[tag=newMortarTracker,limit=1] mathCounter = #MortarIDCounter mathCounter
scoreboard players operation @e[tag=mortarProjectile,limit=1,sort=nearest,distance=..5] mathCounter = #MortarIDCounter mathCounter

# Remove new tracker tag
tag @e[tag=newMortarTracker] remove newMortarTracker

# Reset mortar-loaded flag
scoreboard players set @s _mortarLoaded 0
