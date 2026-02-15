# Normal Parry — blocked outside the perfect timing window

# Player feedback
playsound minecraft:item.shield.block master @s ~ ~ ~ 1.0 1.5
title @s actionbar [{text:"Parry!",color:"white"}]
execute at @s run particle minecraft:crit ~ ~1 ~ 0.3 0.3 0.3 0.1 10

# Resolve own team (target anyone NOT on it)
execute if entity @s[team=Team1] run data modify storage mythcraft:temp myTeam set value "Team1"
execute if entity @s[team=Team2] run data modify storage mythcraft:temp myTeam set value "Team2"
# Resolve damage by character level (Level 1-2: 3, Level 3-4: 4, Level 5: 5)
execute if score @s characterLevel matches ..2 run data modify storage mythcraft:temp dmg set value 3
execute if score @s characterLevel matches 3..4 run data modify storage mythcraft:temp dmg set value 4
execute if score @s characterLevel matches 5 run data modify storage mythcraft:temp dmg set value 5
# Apply damage via macro helper (at @s needed for distance selector)
execute at @s run function mythcraft:parry/apply_normal with storage mythcraft:temp
