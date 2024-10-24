# if player killed a mob on their own team, respawns one from the nearest marker
$execute if score $(cityName) cityOwnership matches 1 as @s[team=Druids] at @e[tag=$(cityName),type=marker,sort=nearest,limit=1] run summon pillager ~ ~ ~ {Glowing:1b,DeathLootTable:"minecraft:empty",CustomNameVisible:1b,Team:"Druids",PersistenceRequired:1b,Health:30f,Tags:["$(cityName)","cityTroop"],CustomName:'["$(cityName)",{"color":"#FFD700","text":" Marksman"}]',HandItems:[{id:"minecraft:crossbow",count:1,components:{"minecraft:unbreakable":{}}},{}],ArmorItems:[{},{},{},{}],attributes:[{id:"minecraft:generic.knockback_resistance",base:0.2},{id:"minecraft:generic.max_health",base:30},{id:"minecraft:generic.movement_speed",base:0.4},{id:"minecraft:generic.scale",base:1}],HandDropChances:[0F,0F],ArmorItemsArmorDropChances:[0F,0F,0F,0F]}
$execute if score $(cityName) cityOwnership matches 2 as @s[team=Royals] at @e[tag=$(cityName),type=marker,sort=nearest,limit=1] run summon pillager ~ ~ ~ {Glowing:1b,DeathLootTable:"minecraft:empty",CustomNameVisible:1b,Team:"Royals",PersistenceRequired:1b,Health:30f,Tags:["$(cityName)","cityTroop"],CustomName:'["$(cityName)",{"color":"#FFD700","text":" Marksman"}]',HandItems:[{id:"minecraft:crossbow",count:1,components:{"minecraft:unbreakable":{}}},{}],ArmorItems:[{},{},{},{}],attributes:[{id:"minecraft:generic.knockback_resistance",base:0.2},{id:"minecraft:generic.max_health",base:30},{id:"minecraft:generic.movement_speed",base:0.4},{id:"minecraft:generic.scale",base:1}],HandDropChances:[0F,0F],ArmorItemsArmorDropChances:[0F,0F,0F,0F]}


$execute unless score $(cityName) cityOwnership matches 1 as @s[team=Druids] run scoreboard players add $(cityName) cityConquerProgress 1
$execute unless score $(cityName) cityOwnership matches 2 as @s[team=Royals] run scoreboard players add $(cityName) cityConquerProgress 1
$execute unless score $(cityName) cityOwnership matches 1 if score $(cityName) cityConquerProgress >= $(cityName) cityConquerValue as @s[team=Druids] run function mythcraft:conquer {cityName:$(cityName), teamId:1, teamName:Druids, rewardFunction: $(advancementName)}
$execute unless score $(cityName) cityOwnership matches 2 if score $(cityName) cityConquerProgress >= $(cityName) cityConquerValue as @s[team=Royals] run function mythcraft:conquer {cityName:$(cityName), teamId:2, teamName:Royals, rewardFunction: $(advancementName)}


$advancement revoke @s only mythcraft:kill/city/$(advancementName)

