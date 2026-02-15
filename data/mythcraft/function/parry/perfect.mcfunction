# Perfect Parry — blocked within timing window of raising shield

# Player feedback
playsound minecraft:block.anvil.land master @s ~ ~ ~ 0.6 1.2
title @s actionbar [{text:"PERFECT PARRY!",color:"gold",bold:true}]
execute at @s run particle minecraft:enchant ~ ~1 ~ 0.5 0.5 0.5 0.3 20
# Brief Resistance I (1 second) — defensive reward even against ranged
effect give @s minecraft:resistance 1 0

# Resolve own team (target anyone NOT on it)
execute if entity @s[team=Team1] run data modify storage mythcraft:temp myTeam set value "Team1"
execute if entity @s[team=Team2] run data modify storage mythcraft:temp myTeam set value "Team2"
# Resolve damage by character level (Level 1-2: 6, Level 3-4: 8, Level 5: 10)
execute if score @s characterLevel matches ..2 run data modify storage mythcraft:temp dmg set value 6
execute if score @s characterLevel matches 3..4 run data modify storage mythcraft:temp dmg set value 8
execute if score @s characterLevel matches 5 run data modify storage mythcraft:temp dmg set value 10
# Apply damage + slowness via macro helper (at @s needed for distance selector)
execute at @s run function mythcraft:parry/apply_perfect with storage mythcraft:temp
