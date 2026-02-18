# Process class selection trigger
# Runs as the player who used /trigger selectClass set 1/2/3
scoreboard players operation @s playerClass = @s selectClass
execute if score @s playerClass matches 1 run tellraw @s {color:"gold",text:"Class changed to Warrior"}
execute if score @s playerClass matches 2 run tellraw @s {color:"red",text:"Class changed to Assassin"}
execute if score @s playerClass matches 3 run tellraw @s {color:"blue",text:"Class changed to Bastion"}
# Cancel stealth if active + reset charge on class change
execute if score @s stealthTimer matches 1.. run effect clear @s speed
execute if score @s stealthTimer matches 1.. run function mythcraft:stealth/cancel
scoreboard players set @s totemCharge 0
# Reset parry state on class change
scoreboard players set @s parryWindow 0
scoreboard players set @s parryCooldown 0
scoreboard players set @s _shieldTick 0
scoreboard players set @s _wasBlocking 0
# Reset mortar state on class change
scoreboard players set @s mortarCooldown 0
scoreboard players set @s _crossbowLoaded 0
scoreboard players set @s _mortarLoaded 0
function mythcraft:rekit
scoreboard players set @s selectClass 0
scoreboard players enable @s selectClass
