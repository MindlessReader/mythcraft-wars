# Resolve location config and spawn the raid boss
# Params: $(name) — location ID (e.g. "City3", "Attack"), $(configPath) — e.g. "cities.City3"

# Look up display name from config
$data modify storage mythcraft:temp cityDisplayName set from storage mythcraft:config $(configPath).name
data modify storage mythcraft:raidboss cityDisplayName set from storage mythcraft:temp cityDisplayName

# Copy raid boss pool to temp and pick random boss type
$data modify storage mythcraft:temp raidBossPool set from storage mythcraft:config $(configPath).raidBossPool

execute store result score _poolSize mathCounter run data get storage mythcraft:temp raidBossPool
execute store result score _poolIndex mathCounter run random value 0..99
scoreboard players operation _poolIndex mathCounter %= _poolSize mathCounter
execute if score _poolIndex mathCounter matches 0 run data modify storage mythcraft:temp bossType set from storage mythcraft:temp raidBossPool[0]
execute if score _poolIndex mathCounter matches 1 run data modify storage mythcraft:temp bossType set from storage mythcraft:temp raidBossPool[1]
execute if score _poolIndex mathCounter matches 2 run data modify storage mythcraft:temp bossType set from storage mythcraft:temp raidBossPool[2]
execute if score _poolIndex mathCounter matches 3 run data modify storage mythcraft:temp bossType set from storage mythcraft:temp raidBossPool[3]

# Store boss type for runtime
data modify storage mythcraft:raidboss bossType set from storage mythcraft:temp bossType

# Resolve boss display name
function mythcraft:raidboss/get_boss_text with storage mythcraft:raidboss

# Reset threshold announcement flags
data modify storage mythcraft:raidboss announced75 set value 0b
data modify storage mythcraft:raidboss announced50 set value 0b
data modify storage mythcraft:raidboss announced25 set value 0b

# Build formatted reward text string for menu display
data modify storage mythcraft:temp raidBossRewardsList set value ""
execute if data storage mythcraft:config {rewards:{raidBossPool:["victory_point"]}} run data modify storage mythcraft:temp rewardName set value "1 Victory Point"
execute if data storage mythcraft:config {rewards:{raidBossPool:["victory_point"]}} run function mythcraft:raidboss/helpers/build_reward_line with storage mythcraft:temp
execute if data storage mythcraft:config {rewards:{raidBossPool:["golden_apple"]}} run data modify storage mythcraft:temp rewardName set value "Enchanted Golden Apple"
execute if data storage mythcraft:config {rewards:{raidBossPool:["golden_apple"]}} run function mythcraft:raidboss/helpers/build_reward_line with storage mythcraft:temp
execute if data storage mythcraft:config {rewards:{raidBossPool:["ender_pearls"]}} run data modify storage mythcraft:temp rewardName set value "5 Ender Pearls"
execute if data storage mythcraft:config {rewards:{raidBossPool:["ender_pearls"]}} run function mythcraft:raidboss/helpers/build_reward_line with storage mythcraft:temp
execute if data storage mythcraft:config {rewards:{raidBossPool:["wind_charges"]}} run data modify storage mythcraft:temp rewardName set value "5 Wind Charges"
execute if data storage mythcraft:config {rewards:{raidBossPool:["wind_charges"]}} run function mythcraft:raidboss/helpers/build_reward_line with storage mythcraft:temp
execute if data storage mythcraft:config {rewards:{raidBossPool:["strength_powder"]}} run data modify storage mythcraft:temp rewardName set value "Blaze Powder of Strength II"
execute if data storage mythcraft:config {rewards:{raidBossPool:["strength_powder"]}} run function mythcraft:raidboss/helpers/build_reward_line with storage mythcraft:temp
execute if data storage mythcraft:config {rewards:{raidBossPool:["harming_potions"]}} run data modify storage mythcraft:temp rewardName set value "3 Potions of Harming II"
execute if data storage mythcraft:config {rewards:{raidBossPool:["harming_potions"]}} run function mythcraft:raidboss/helpers/build_reward_line with storage mythcraft:temp
execute if data storage mythcraft:config {rewards:{raidBossPool:["trident"]}} run data modify storage mythcraft:temp rewardName set value "Sharpness V Trident"
execute if data storage mythcraft:config {rewards:{raidBossPool:["trident"]}} run function mythcraft:raidboss/helpers/build_reward_line with storage mythcraft:temp
execute if data storage mythcraft:config {rewards:{raidBossPool:["invis_kelp"]}} run data modify storage mythcraft:temp rewardName set value "5 Invisibility Kelp"
execute if data storage mythcraft:config {rewards:{raidBossPool:["invis_kelp"]}} run function mythcraft:raidboss/helpers/build_reward_line with storage mythcraft:temp
execute if data storage mythcraft:config {rewards:{raidBossPool:["wind_arrows"]}} run data modify storage mythcraft:temp rewardName set value "20 Wind-Charged Arrows"
execute if data storage mythcraft:config {rewards:{raidBossPool:["wind_arrows"]}} run function mythcraft:raidboss/helpers/build_reward_line with storage mythcraft:temp
execute if data storage mythcraft:config {rewards:{raidBossPool:["levitation_arrows"]}} run data modify storage mythcraft:temp rewardName set value "5 Levitation Arrows"
execute if data storage mythcraft:config {rewards:{raidBossPool:["levitation_arrows"]}} run function mythcraft:raidboss/helpers/build_reward_line with storage mythcraft:temp
execute if data storage mythcraft:config {rewards:{raidBossPool:["poison_potions"]}} run data modify storage mythcraft:temp rewardName set value "3 Poison Splash Potions"
execute if data storage mythcraft:config {rewards:{raidBossPool:["poison_potions"]}} run function mythcraft:raidboss/helpers/build_reward_line with storage mythcraft:temp
execute if data storage mythcraft:config {rewards:{raidBossPool:["regen_tear"]}} run data modify storage mythcraft:temp rewardName set value "Ghast Tear of Regeneration"
execute if data storage mythcraft:config {rewards:{raidBossPool:["regen_tear"]}} run function mythcraft:raidboss/helpers/build_reward_line with storage mythcraft:temp
execute if data storage mythcraft:config {rewards:{raidBossPool:["buff_resistance"]}} run data modify storage mythcraft:temp rewardName set value "Resistance (5:00)"
execute if data storage mythcraft:config {rewards:{raidBossPool:["buff_resistance"]}} run function mythcraft:raidboss/helpers/build_reward_line with storage mythcraft:temp
execute if data storage mythcraft:config {rewards:{raidBossPool:["buff_speed"]}} run data modify storage mythcraft:temp rewardName set value "Speed (5:00)"
execute if data storage mythcraft:config {rewards:{raidBossPool:["buff_speed"]}} run function mythcraft:raidboss/helpers/build_reward_line with storage mythcraft:temp
execute if data storage mythcraft:config {rewards:{raidBossPool:["buff_health_boost"]}} run data modify storage mythcraft:temp rewardName set value "Health Boost II (5:00)"
execute if data storage mythcraft:config {rewards:{raidBossPool:["buff_health_boost"]}} run function mythcraft:raidboss/helpers/build_reward_line with storage mythcraft:temp
execute if data storage mythcraft:config {rewards:{raidBossPool:["buff_strength"]}} run data modify storage mythcraft:temp rewardName set value "Strength (5:00)"
execute if data storage mythcraft:config {rewards:{raidBossPool:["buff_strength"]}} run function mythcraft:raidboss/helpers/build_reward_line with storage mythcraft:temp
execute if data storage mythcraft:config {rewards:{raidBossPool:["nourishing_bread"]}} run data modify storage mythcraft:temp rewardName set value "64 Nourishing Bread"
execute if data storage mythcraft:config {rewards:{raidBossPool:["nourishing_bread"]}} run function mythcraft:raidboss/helpers/build_reward_line with storage mythcraft:temp
data modify storage mythcraft:raidboss rewardText set from storage mythcraft:temp raidBossRewardsList

# Announce spawn (before entity spawn — gets players moving to load the chunks)
tellraw @a [{bold:true,color:"dark_purple",text:"=== RAID BOSS SPAWNED ==="}]
tellraw @a [{nbt:"bossDisplayName",storage:"mythcraft:raidboss",color:"dark_purple",bold:true},{text:" has appeared at ",color:"white"},{nbt:"cityDisplayName",storage:"mythcraft:raidboss",color:"red"},{text:"!",color:"white"}]
tellraw @a [{text:"Rewards:",color:"gold"}]
function mythcraft:raidboss/helpers/display_rewards
tellraw @a [{bold:true,color:"dark_purple",text:"========================"}]

title @a title [{bold:true,color:"dark_purple",text:"RAID BOSS"}]
title @a subtitle [{nbt:"bossDisplayName",storage:"mythcraft:raidboss"},{text:" at ",color:"white"},{nbt:"cityDisplayName",storage:"mythcraft:raidboss",color:"red"}]
execute as @a at @s run playsound minecraft:entity.wither.spawn master @s ~ ~ ~ 1.0 0.8

data modify storage mythcraft:temp debugBossType set from storage mythcraft:raidboss bossType
data modify storage mythcraft:temp debugLocation set from storage mythcraft:temp cityDisplayName
execute if entity @a[tag=debugMode] run function mythcraft:debug/raidboss_announce with storage mythcraft:temp

# Try to spawn at marker (may fail if chunks not loaded)
function mythcraft:raidboss/attempt_entity_spawn with storage mythcraft:raidboss

# If marker wasn't loaded (state still 0), start deferred spawn loop
execute unless score RaidBoss raidBossState matches 1 if entity @a[tag=debugMode] run say [DEBUG] Raid Boss marker not loaded, deferring spawn
execute unless score RaidBoss raidBossState matches 1 run data modify storage mythcraft:raidboss spawnPending set value 1b
execute unless score RaidBoss raidBossState matches 1 run schedule function mythcraft:raidboss/spawn_loop 5s
