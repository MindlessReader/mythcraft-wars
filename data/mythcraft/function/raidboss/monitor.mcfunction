# 1s scheduled loop while raid boss is alive
# Handles: fallback death detection, tether check

# Abort if no longer alive
execute unless score RaidBoss raidBossState matches 1 run return 0

# Track consecutive seconds where marker is loaded but boss entity is missing
# Boss can wander into adjacent chunks (up to tether distance), so it may load later than its marker
# Require 5+ consecutive seconds missing before treating as dead (prevents chunk loading race)
execute if entity @e[type=marker,tag=spawnmarker_raidboss] unless entity @e[tag=raidBoss] run scoreboard players add _raidBossMissing mathCounter 1
execute unless entity @e[type=marker,tag=spawnmarker_raidboss] run scoreboard players set _raidBossMissing mathCounter 0
execute if entity @e[tag=raidBoss] run scoreboard players set _raidBossMissing mathCounter 0

# Fallback respawn: boss confirmed gone (5+ seconds missing with marker loaded)
# Only actual player kills (on_kill advancement) award VP/rewards — this always respawns
execute if score _raidBossMissing mathCounter matches 5.. if entity @a[tag=debugMode] run say [DEBUG] Raid Boss entity missing 5+ seconds — resetting and respawning
execute if score _raidBossMissing mathCounter matches 5.. run scoreboard players set _raidBossMissing mathCounter 0
execute if score _raidBossMissing mathCounter matches 5.. run scoreboard players set RaidBoss raidBossState 0
execute if score _raidBossMissing mathCounter matches 5.. run schedule function mythcraft:raidboss/cleanup_splits 2t
execute if score _raidBossMissing mathCounter matches 5.. run schedule function mythcraft:raidboss/try_spawn 5s
execute if score _raidBossMissing mathCounter matches 5.. run return 0

# Tether check: if boss is >50 blocks from its spawn marker, teleport back
execute as @e[tag=raidBoss] at @s unless entity @e[type=marker,tag=spawnmarker_raidboss,distance=..50] run function mythcraft:raidboss/tether

# Reschedule
schedule function mythcraft:raidboss/monitor 1s
