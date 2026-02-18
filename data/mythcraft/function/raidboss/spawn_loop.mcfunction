# Periodically retry spawning the raid boss entity when its marker wasn't loaded
# Called every 5s until the marker's chunk loads and the boss spawns

# Abort if no longer pending, already spawned, or game over
execute unless data storage mythcraft:raidboss {spawnPending:1b} run return 0
execute if score RaidBoss raidBossState matches 1.. run return 0
execute if score QuestTracker endGame matches 2 run return 0

# Restore temp data from persistent raidboss storage (may have been overwritten)
data modify storage mythcraft:temp bossType set from storage mythcraft:raidboss bossType
data modify storage mythcraft:temp cityDisplayName set from storage mythcraft:raidboss cityDisplayName

# Try to spawn at marker
function mythcraft:raidboss/attempt_entity_spawn with storage mythcraft:raidboss

# If still pending, reschedule
execute if data storage mythcraft:raidboss {spawnPending:1b} if entity @a[tag=debugMode] run say [DEBUG] Raid Boss spawn retry (marker still not loaded)
execute if data storage mythcraft:raidboss {spawnPending:1b} run schedule function mythcraft:raidboss/spawn_loop 5s
