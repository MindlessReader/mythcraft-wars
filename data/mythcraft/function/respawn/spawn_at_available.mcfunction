# Spawn one troop at an unoccupied marker, with fallback to any marker
# Requires: poolType, cityName, teamName, cityDisplayName, regularPool/bossPool in mythcraft:temp

# Tag all markers of the right type as available spawn points
$execute if data storage mythcraft:temp {poolType:"regular"} run tag @e[type=marker,tag=spawnmarker_regular,tag=$(cityName)] add _availableSpawn
$execute if data storage mythcraft:temp {poolType:"boss"} run tag @e[type=marker,tag=spawnmarker_boss,tag=$(cityName)] add _availableSpawn

# Remove tag from markers that already have a troop nearby (~2 blocks)
$execute if data storage mythcraft:temp {poolType:"regular"} as @e[tag=_availableSpawn] at @s if entity @e[tag=cityTroop,tag=regularTroop,tag=$(cityName),distance=..2] run tag @s remove _availableSpawn
$execute if data storage mythcraft:temp {poolType:"boss"} as @e[tag=_availableSpawn] at @s if entity @e[tag=cityTroop,tag=bossTroop,tag=$(cityName),distance=..2] run tag @s remove _availableSpawn

# Spawn at random unoccupied marker; fall back to any marker if all occupied
execute if entity @e[tag=_availableSpawn] at @e[tag=_availableSpawn,sort=random,limit=1] run function mythcraft:respawn/spawn_from_pool
$execute unless entity @e[tag=_availableSpawn] if data storage mythcraft:temp {poolType:"regular"} at @e[type=marker,tag=spawnmarker_regular,tag=$(cityName),sort=random,limit=1] run function mythcraft:respawn/spawn_from_pool
$execute unless entity @e[tag=_availableSpawn] if data storage mythcraft:temp {poolType:"boss"} at @e[type=marker,tag=spawnmarker_boss,tag=$(cityName),sort=random,limit=1] run function mythcraft:respawn/spawn_from_pool

# Cleanup
tag @e remove _availableSpawn
