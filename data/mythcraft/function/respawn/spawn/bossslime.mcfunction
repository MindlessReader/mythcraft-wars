# Boss slime troop — Size:1 so it has attack AI; splits into harmless Size:0 children
# Children cleaned up per-tick in tick.mcfunction (adapted from raidboss/cleanup_splits)

$summon slime ~ ~ ~ {Size:1,Glowing:1b,CustomNameVisible:1b,DeathLootTable:"minecraft:empty",Team:"$(teamName)",PersistenceRequired:1b,Tags:["$(cityName)","cityTroop","bossTroop"],CustomName:[{text:"$(cityDisplayName)"},{color:"#FFD700",text:" Royal Ooze"}],attributes:[{id:"minecraft:max_health",base:55},{id:"minecraft:attack_damage",base:5},{id:"minecraft:knockback_resistance",base:-0.5},{id:"minecraft:movement_speed",base:0.35},{id:"minecraft:scale",base:1.8},{id:"minecraft:jump_strength",base:0.8},{id:"minecraft:safe_fall_distance",base:100.0}]}

# Heal to full HP (max_health override requires healing to apply)
execute as @e[type=slime,tag=cityTroop,tag=bossTroop,limit=1,sort=nearest,distance=..3] run effect give @s instant_health 1 100 true
