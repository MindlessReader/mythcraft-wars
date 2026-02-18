# Consume 25% charge and apply buff effects
# Deduct 25% of max charge based on character level
execute if score @s characterLevel matches ..1 run scoreboard players remove @s totemCharge 16
execute if score @s characterLevel matches 2 run scoreboard players remove @s totemCharge 12
execute if score @s characterLevel matches 3 run scoreboard players remove @s totemCharge 9
execute if score @s characterLevel matches 4 run scoreboard players remove @s totemCharge 6
execute if score @s characterLevel matches 5.. run scoreboard players remove @s totemCharge 4

# Sync totem display + set cooldown (40 ticks = 2 seconds)
function mythcraft:totem/update
scoreboard players set @s totemCooldown 40

# Feedback
playsound minecraft:item.totem.use master @s ~ ~ ~ 0.5 1.5
title @s actionbar [{text:"Totem Activated!",color:"gold"}]

# Speed 2 (30s) to player + nearby allies
execute if entity @s[team=Team1] at @s run effect give @a[distance=..10,team=Team1] speed 30 1
execute if entity @s[team=Team2] at @s run effect give @a[distance=..10,team=Team2] speed 30 1

# Invisibility (15s) + stealth visuals via generic stealth system
function mythcraft:stealth/start {seconds:15}
# Hide totem item model (totem-specific, not in generic stealth)
item modify entity @s weapon.offhand {function:"minecraft:set_components",components:{"minecraft:item_model":"mythcraft:invisible"}}
