# Pick a random reward from the quest pool in mythcraft:temp questPool
# Sets mythcraft:quest rewardId to the selected reward string ID
# Uses same pattern as respawn/pick_regular: pool size → random modulo → conditional chain

execute store result score _poolSize mathCounter run data get storage mythcraft:temp questPool
execute store result score _poolIndex mathCounter run random value 0..99
scoreboard players operation _poolIndex mathCounter %= _poolSize mathCounter

execute if score _poolIndex mathCounter matches 0 run data modify storage mythcraft:quest rewardId set from storage mythcraft:temp questPool[0]
execute if score _poolIndex mathCounter matches 1 run data modify storage mythcraft:quest rewardId set from storage mythcraft:temp questPool[1]
execute if score _poolIndex mathCounter matches 2 run data modify storage mythcraft:quest rewardId set from storage mythcraft:temp questPool[2]
execute if score _poolIndex mathCounter matches 3 run data modify storage mythcraft:quest rewardId set from storage mythcraft:temp questPool[3]
execute if score _poolIndex mathCounter matches 4 run data modify storage mythcraft:quest rewardId set from storage mythcraft:temp questPool[4]
execute if score _poolIndex mathCounter matches 5 run data modify storage mythcraft:quest rewardId set from storage mythcraft:temp questPool[5]
execute if score _poolIndex mathCounter matches 6 run data modify storage mythcraft:quest rewardId set from storage mythcraft:temp questPool[6]
execute if score _poolIndex mathCounter matches 7 run data modify storage mythcraft:quest rewardId set from storage mythcraft:temp questPool[7]
execute if score _poolIndex mathCounter matches 8 run data modify storage mythcraft:quest rewardId set from storage mythcraft:temp questPool[8]
execute if score _poolIndex mathCounter matches 9 run data modify storage mythcraft:quest rewardId set from storage mythcraft:temp questPool[9]
execute if score _poolIndex mathCounter matches 10 run data modify storage mythcraft:quest rewardId set from storage mythcraft:temp questPool[10]
execute if score _poolIndex mathCounter matches 11 run data modify storage mythcraft:quest rewardId set from storage mythcraft:temp questPool[11]
execute if score _poolIndex mathCounter matches 12 run data modify storage mythcraft:quest rewardId set from storage mythcraft:temp questPool[12]
execute if score _poolIndex mathCounter matches 13 run data modify storage mythcraft:quest rewardId set from storage mythcraft:temp questPool[13]
execute if score _poolIndex mathCounter matches 14 run data modify storage mythcraft:quest rewardId set from storage mythcraft:temp questPool[14]

# Lookup display name
function mythcraft:rewards/get_reward_text with storage mythcraft:quest
