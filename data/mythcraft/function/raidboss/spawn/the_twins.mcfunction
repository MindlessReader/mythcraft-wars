# The Twins raid boss spawn template
# Params: $(cityDisplayName)
# Spawns a paired giant skeleton and zombie (12 blocks tall) with shared health pool

# Spawn the skeleton twin (scale 6.0 ≈ 12 blocks tall)
$summon skeleton ~ ~ ~ {Glowing:1b,CustomNameVisible:1b,DeathLootTable:"minecraft:empty",Team:"Unaligned",PersistenceRequired:1b,Tags:["raidBoss","raidBossTwin","raidBossTwinA"],CustomName:[{text:"$(cityDisplayName) ",color:"white"},{text:"The Twins",color:"dark_purple",bold:true},{text:" - Skeleton",color:"gray"}],attributes:[{id:"minecraft:max_health",base:250},{id:"minecraft:movement_speed",base:0.3},{id:"minecraft:knockback_resistance",base:0.8},{id:"minecraft:scale",base:6.0},{id:"minecraft:attack_damage",base:12}],equipment:{mainhand:{id:"minecraft:bow",count:1},head:{id:"minecraft:iron_helmet",count:1,components:{"minecraft:unbreakable":{},tooltip_display:{hidden_components:["minecraft:unbreakable"]}}}}}

# Set skeleton to full HP (can't use instant_health — damages undead)
execute as @e[type=skeleton,tag=raidBossTwinA,limit=1,sort=nearest] run data modify entity @s Health set value 250.0f

# Spawn the zombie twin offset by 3 blocks
$summon zombie ~3 ~ ~ {Glowing:1b,CustomNameVisible:1b,DeathLootTable:"minecraft:empty",Team:"Unaligned",PersistenceRequired:1b,Tags:["raidBoss","raidBossTwin","raidBossTwinB"],CustomName:[{text:"$(cityDisplayName) ",color:"white"},{text:"The Twins",color:"dark_purple",bold:true},{text:" - Zombie",color:"dark_green"}],attributes:[{id:"minecraft:max_health",base:250},{id:"minecraft:movement_speed",base:0.3},{id:"minecraft:knockback_resistance",base:0.8},{id:"minecraft:scale",base:6.0},{id:"minecraft:attack_damage",base:14}],equipment:{head:{id:"minecraft:iron_helmet",count:1,components:{"minecraft:unbreakable":{},tooltip_display:{hidden_components:["minecraft:unbreakable"]}}}}}

# Set zombie to full HP (can't use instant_health — damages undead)
execute as @e[type=zombie,tag=raidBossTwinB,limit=1,sort=nearest] run data modify entity @s Health set value 250.0f

# Continue with post-spawn setup (reads HP from one twin — both have same max)
function mythcraft:raidboss/post_spawn
