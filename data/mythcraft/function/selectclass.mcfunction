# Process class selection trigger
# Runs as the player who used /trigger selectClass set 1/2/3
scoreboard players operation @s playerClass = @s selectClass
execute if score @s playerClass matches 1 run tellraw @s {color:"gold",text:"Class changed to Warrior"}
execute if score @s playerClass matches 2 run tellraw @s {color:"red",text:"Class changed to Assassin"}
execute if score @s playerClass matches 3 run tellraw @s {color:"blue",text:"Class changed to Bastion"}
# Cancel totem stealth if active + reset charge on class change
execute if score @s totemInvisTimer matches 1.. run function mythcraft:totem/cancel_invis
scoreboard players set @s totemCharge 0
function mythcraft:rekit
scoreboard players set @s selectClass 0
scoreboard players enable @s selectClass
