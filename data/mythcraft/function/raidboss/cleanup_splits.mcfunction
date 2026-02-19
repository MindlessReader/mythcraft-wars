# Kill raid boss remnants near the spawn marker and the killing player
# Runs every tick for 2 seconds (40 ticks) to catch delayed death animations
# Slime children inherit tags — target raidBoss-tagged slimes within 50 blocks of either location
# Set empty loot table on children before killing (they don't inherit DeathLootTable)
execute as @e[type=minecraft:slime,tag=raidBoss] run data merge entity @s {DeathLootTable:"minecraft:empty"}
execute at @e[type=marker,tag=spawnmarker_raidboss] run kill @e[type=minecraft:slime,tag=raidBoss,distance=..50]
execute as @a[tag=_raidBossKiller] at @s run kill @e[type=minecraft:slime,tag=raidBoss,distance=..50]
# Kill any surviving twin entities (safety net)
kill @e[tag=raidBossTwin]

# Decrement timer and reschedule if ticks remain
scoreboard players remove RaidBoss cleanupTimer 1
execute if score RaidBoss cleanupTimer matches 1.. run schedule function mythcraft:raidboss/cleanup_splits 1t

# Final tick: clean up tags and log
execute if score RaidBoss cleanupTimer matches ..0 run tag @a[tag=_raidBossKiller] remove _raidBossKiller
execute if score RaidBoss cleanupTimer matches ..0 if entity @a[tag=debugMode] run say [DEBUG] Raid Boss cleanup finished
