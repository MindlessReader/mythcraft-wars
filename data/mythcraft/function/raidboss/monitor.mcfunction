# 1s scheduled loop while raid boss is alive
# Handles: fallback death detection, tether check

# Abort if no longer alive
execute unless score RaidBoss raidBossState matches 1 run return 0

# Fallback death detection: entity gone but state still 1 (non-player kill, e.g. environmental)
execute unless entity @e[tag=raidBoss] run function mythcraft:raidboss/on_death
execute unless score RaidBoss raidBossState matches 1 run return 0

# Tether check: if boss is >30 blocks from its spawn marker, teleport back
execute as @e[tag=raidBoss] at @s unless entity @e[type=marker,tag=spawnmarker_raidboss,distance=..30] run function mythcraft:raidboss/tether

# Reschedule
schedule function mythcraft:raidboss/monitor 1s
