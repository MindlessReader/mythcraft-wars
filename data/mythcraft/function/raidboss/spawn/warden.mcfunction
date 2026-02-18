# Warden raid boss spawn template
# Params: $(cityDisplayName)
# Spawns a warden with standard stats, Glowing, Unaligned team
# NOTE: Wardens summoned with ANY NBT data immediately dig and despawn (MC-252659).
# Workaround: summon with zero NBT, then apply data via merge in the same tick.

summon warden ~ ~ ~
tag @e[type=warden,distance=..2,limit=1,sort=nearest] add raidBoss
$data merge entity @e[type=warden,tag=raidBoss,limit=1,sort=nearest] {Glowing:1b,CustomNameVisible:1b,DeathLootTable:"minecraft:empty",Team:"Unaligned",PersistenceRequired:1b,CustomName:[{text:"$(cityDisplayName) ",color:"white"},{text:"Literally Just a Warden",color:"dark_purple",bold:true}]}

# Prevent digging by setting a long dig cooldown (refreshed by monitor loop)
data merge entity @e[type=warden,tag=raidBoss,limit=1,sort=nearest] {Brain:{memories:{"minecraft:dig_cooldown":{value:{},ttl:1200L}}}}

# Continue with post-spawn setup
function mythcraft:raidboss/post_spawn
