# Giant slime raid boss spawn template
# Params: $(cityDisplayName)
# Spawns a size-0 slime (won't split) scaled up to 6x with 300 HP, Glowing, Unaligned team

$summon slime ~ ~ ~ {Size:0,Glowing:1b,CustomNameVisible:1b,DeathLootTable:"minecraft:empty",Team:"Unaligned",PersistenceRequired:1b,Tags:["raidBoss"],CustomName:[{text:"$(cityDisplayName) ",color:"white"},{text:"Ancient Slime King",color:"dark_purple",bold:true}],attributes:[{id:"minecraft:max_health",base:300},{id:"minecraft:movement_speed",base:0.4},{id:"minecraft:knockback_resistance",base:0.8},{id:"minecraft:scale",base:6.0}]}

# Heal to full HP (max_health override requires healing to apply)
execute as @e[type=slime,tag=raidBoss,limit=1,sort=nearest] run effect give @s instant_health 1 100 true

# Continue with post-spawn setup
function mythcraft:raidboss/post_spawn
