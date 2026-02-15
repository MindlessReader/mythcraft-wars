# Apply Jump Boost to nearby team members (call helper with team macro)
execute as @s[tag=Team1] at @s run function mythcraft:mortar/field_apply {team:"Team1"}
execute as @s[tag=Team2] at @s run function mythcraft:mortar/field_apply {team:"Team2"}

# Team-colored particles (scale with character level)
# Level 1-2: radius 1.5, count 8
execute as @s[tag=Team1,scores={mortarCharLevel=1..2}] at @s run particle entity_effect{color:[0.33f,1.0f,0.33f,0.8f]} ~ ~0.3 ~ 1.5 0.3 1.5 0 8
execute as @s[tag=Team2,scores={mortarCharLevel=1..2}] at @s run particle entity_effect{color:[0.24f,0.27f,0.67f,0.8f]} ~ ~0.3 ~ 1.5 0.3 1.5 0 8

# Level 3-4: radius 2.0, count 10
execute as @s[tag=Team1,scores={mortarCharLevel=3..4}] at @s run particle entity_effect{color:[0.33f,1.0f,0.33f,0.8f]} ~ ~0.3 ~ 2.0 0.3 2.0 0 10
execute as @s[tag=Team2,scores={mortarCharLevel=3..4}] at @s run particle entity_effect{color:[0.24f,0.27f,0.67f,0.8f]} ~ ~0.3 ~ 2.0 0.3 2.0 0 10

# Level 5: radius 2.5, count 12
execute as @s[tag=Team1,scores={mortarCharLevel=5..}] at @s run particle entity_effect{color:[0.33f,1.0f,0.33f,0.8f]} ~ ~0.3 ~ 2.5 0.3 2.5 0 12
execute as @s[tag=Team2,scores={mortarCharLevel=5..}] at @s run particle entity_effect{color:[0.24f,0.27f,0.67f,0.8f]} ~ ~0.3 ~ 2.5 0.3 2.5 0 12

# Decrement lifetime
scoreboard players remove @s mortarFieldLife 1

# Kill field when expired
execute if score @s mortarFieldLife matches ..0 run kill @s
