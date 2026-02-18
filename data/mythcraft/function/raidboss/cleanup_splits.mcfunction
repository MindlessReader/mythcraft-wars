# Kill raid boss remnants near the spawn marker
# Slime children don't inherit tags, so kill all slimes within 30 blocks of any raidboss marker
execute at @e[type=marker,tag=spawnmarker_raidboss] run kill @e[type=minecraft:slime,distance=..30]
# Kill any surviving twin entities (safety net)
kill @e[tag=raidBossTwin]
execute if entity @a[tag=debugMode] run say [DEBUG] Raid Boss cleanup executed
