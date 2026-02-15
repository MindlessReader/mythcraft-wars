# Refund the arrow that was consumed during crossbow loading
data modify storage mythcraft:temp refundItem set from entity @s Inventory[{Slot:1b}].components."minecraft:charged_projectiles"[0]
execute at @s run summon item ~ ~ ~ {PickupDelay:10,Motion:[0.0,0.0,0.0],Age:-32768,Tags:["mortarRefund"],Item:{id:"minecraft:arrow",count:1}}
execute store success score @s mathCounter run data modify entity @e[type=item,tag=mortarRefund,limit=1,sort=nearest] Item set from storage mythcraft:temp refundItem
data modify entity @e[type=item,tag=mortarRefund,limit=1,sort=nearest] PickupDelay set value 0
tag @e[tag=mortarRefund] remove mortarRefund

# Replace loaded arrow with team-colored firework rocket
execute as @s[team=Team1] run item modify entity @s hotbar.1 mythcraft:mortar_load_team1
execute as @s[team=Team2] run item modify entity @s hotbar.1 mythcraft:mortar_load_team2

# Set cooldown and mortar-loaded flag
scoreboard players set @s mortarCooldown 200
scoreboard players set @s _mortarLoaded 1

# Sound cue
playsound minecraft:entity.firework_rocket.launch master @s ~ ~ ~ 1 0.8
