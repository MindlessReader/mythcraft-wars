# Regular slime troop — Size:1 so it has attack AI; splits into harmless Size:0 children
# Children cleaned up per-tick in tick.mcfunction (adapted from raidboss/cleanup_splits)

$summon slime ~ ~ ~ {Size:1,Glowing:1b,CustomNameVisible:1b,DeathLootTable:"minecraft:empty",Team:"$(teamName)",PersistenceRequired:1b,Tags:["$(cityName)","cityTroop","regularTroop"],CustomName:[{text:"$(cityDisplayName)"},{color:"#FFD700",text:" Ooze"}],attributes:[{id:"minecraft:max_health",base:28},{id:"minecraft:attack_damage",base:3},{id:"minecraft:knockback_resistance",base:-1.0},{id:"minecraft:movement_speed",base:0.3},{id:"minecraft:scale",base:1.0},{id:"minecraft:jump_strength",base:0.6},{id:"minecraft:safe_fall_distance",base:100.0}]}

# Heal to full HP (max_health override requires healing to apply)
execute as @e[type=slime,tag=cityTroop,tag=regularTroop,limit=1,sort=nearest,distance=..2] run effect give @s instant_health 1 100 true
