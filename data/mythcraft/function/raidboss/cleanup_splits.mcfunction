# Kill slime split children near the raid boss spawn marker
# Slime children don't inherit tags, so kill all slimes within 30 blocks of any raidboss marker
execute at @e[type=marker,tag=spawnmarker_raidboss] run kill @e[type=minecraft:slime,distance=..30]
execute if entity @a[tag=debugMode] run say [DEBUG] Raid Boss slime splits cleanup executed
