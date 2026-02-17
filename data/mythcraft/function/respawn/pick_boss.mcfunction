# Pick a random boss troop type from the pool in mythcraft:temp bossPool
# Called at marker position; cityName/teamName/cityDisplayName must be in mythcraft:temp
execute store result score _poolSize mathCounter run data get storage mythcraft:temp bossPool
execute store result score _poolIndex mathCounter run random value 0..99
scoreboard players operation _poolIndex mathCounter %= _poolSize mathCounter
execute if score _poolIndex mathCounter matches 0 run data modify storage mythcraft:temp troopType set from storage mythcraft:temp bossPool[0]
execute if score _poolIndex mathCounter matches 1 run data modify storage mythcraft:temp troopType set from storage mythcraft:temp bossPool[1]
execute if score _poolIndex mathCounter matches 2 run data modify storage mythcraft:temp troopType set from storage mythcraft:temp bossPool[2]
execute if score _poolIndex mathCounter matches 3 run data modify storage mythcraft:temp troopType set from storage mythcraft:temp bossPool[3]
execute if score _poolIndex mathCounter matches 4 run data modify storage mythcraft:temp troopType set from storage mythcraft:temp bossPool[4]
execute if score _poolIndex mathCounter matches 5 run data modify storage mythcraft:temp troopType set from storage mythcraft:temp bossPool[5]
function mythcraft:respawn/spawn_type with storage mythcraft:temp
