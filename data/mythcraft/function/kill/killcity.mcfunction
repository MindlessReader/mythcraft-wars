# character XP for individual progression (only for enemy troop kills)
$execute unless score $(cityName) cityOwnership matches 1 as @s[team=Team1] run scoreboard players operation @s characterXP += TroopKill characterXPReward
$execute unless score $(cityName) cityOwnership matches 2 as @s[team=Team2] run scoreboard players operation @s characterXP += TroopKill characterXPReward
function mythcraft:leveling/character/checklevel
# assassin totem charge (+1 for enemy troop kills only)
$execute unless score $(cityName) cityOwnership matches 1 if score @s playerClass matches 2 as @s[team=Team1] run function mythcraft:totem/charge {amount:1}
$execute unless score $(cityName) cityOwnership matches 2 if score @s playerClass matches 2 as @s[team=Team2] run function mythcraft:totem/charge {amount:1}

# if player killed a mob on their own team, respawns one from the nearest marker
$execute if score $(cityName) cityOwnership matches 1 as @s[team=Team1] at @e[tag=$(cityName),type=marker,sort=nearest,limit=1] run summon pillager ~ ~ ~ {Glowing:1b,DeathLootTable:"minecraft:empty",CustomNameVisible:1b,Team:"Team1",PersistenceRequired:1b,Health:30f,Tags:["$(cityName)","cityTroop"],CustomName:[{text:"$(cityDisplayName)"},{color:"#FFD700",text:" Marksman"}],equipment:{mainhand:{id:"minecraft:crossbow",count:1,components:{"minecraft:unbreakable":{}}}},drop_chances:{mainhand:0f},attributes:[{id:"minecraft:knockback_resistance",base:0.2},{id:"minecraft:max_health",base:30},{id:"minecraft:movement_speed",base:0.4},{id:"minecraft:scale",base:1}]}
$execute if score $(cityName) cityOwnership matches 2 as @s[team=Team2] at @e[tag=$(cityName),type=marker,sort=nearest,limit=1] run summon pillager ~ ~ ~ {Glowing:1b,DeathLootTable:"minecraft:empty",CustomNameVisible:1b,Team:"Team2",PersistenceRequired:1b,Health:30f,Tags:["$(cityName)","cityTroop"],CustomName:[{text:"$(cityDisplayName)"},{color:"#FFD700",text:" Marksman"}],equipment:{mainhand:{id:"minecraft:crossbow",count:1,components:{"minecraft:unbreakable":{}}}},drop_chances:{mainhand:0f},attributes:[{id:"minecraft:knockback_resistance",base:0.2},{id:"minecraft:max_health",base:30},{id:"minecraft:movement_speed",base:0.4},{id:"minecraft:scale",base:1}]}


$execute unless score $(cityName) cityOwnership matches 1 as @s[team=Team1] run scoreboard players add $(cityName) cityConquerProgress 1
$execute unless score $(cityName) cityOwnership matches 2 as @s[team=Team2] run scoreboard players add $(cityName) cityConquerProgress 1
$execute unless score $(cityName) cityOwnership matches 1 if score $(cityName) cityConquerProgress >= $(cityName) cityConquerValue as @s[team=Team1] run function mythcraft:conquer {cityId:$(cityName), teamId:1, teamName:Team1, rewardFunction:$(advancementName), cityDisplayName:$(cityDisplayName)}
$execute unless score $(cityName) cityOwnership matches 2 if score $(cityName) cityConquerProgress >= $(cityName) cityConquerValue as @s[team=Team2] run function mythcraft:conquer {cityId:$(cityName), teamId:2, teamName:Team2, rewardFunction:$(advancementName), cityDisplayName:$(cityDisplayName)}


$advancement revoke @s only mythcraft:kill/city/$(advancementName)

