# Teleport raid boss back to its spawn marker
# Run as the raid boss entity, at the boss position

execute if entity @a[tag=debugMode] run say [DEBUG] Raid Boss tethered (too far from spawn marker)

# Find nearest raidboss marker and teleport there
tp @s @e[type=marker,tag=spawnmarker_raidboss,sort=nearest,limit=1]

# Visual feedback
execute at @s run particle minecraft:cloud ~ ~1 ~ 0.5 0.5 0.5 0.02 20
execute at @s run playsound minecraft:entity.enderman.teleport hostile @a ~ ~ ~ 0.5 1.2
