# Per-entity burn tick: particles + attributed damage every second
# Called as @e[tag=_fireballBurn] at @s from tick.mcfunction

# Visual burn effect (flame + smoke particles)
particle minecraft:flame ~ ~0.5 ~ 0.3 0.5 0.3 0.02 2
particle minecraft:large_smoke ~ ~0.5 ~ 0.2 0.4 0.2 0.01 1

# 1-second damage interval via subtick counter
scoreboard players add @s _fbSubTick 1
execute if score @s _fbSubTick matches 20.. run function mythcraft:spells/fireburndamage

# Decrement main timer
scoreboard players remove @s _fbBurnTimer 1

# Clean up when burn expires
execute if score @s _fbBurnTimer matches ..0 run tag @s remove _fireballBurn
execute if score @s _fbBurnTimer matches ..0 run tag @s remove _fbTeam1
execute if score @s _fbBurnTimer matches ..0 run tag @s remove _fbTeam2
