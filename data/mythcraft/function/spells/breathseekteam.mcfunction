# LEGACY SYSTEM - Dragon's Breath spell (replaced by Fireball)
# Preserved for potential future use or reference
# To re-enable: uncomment dragon_breath line in rekit.mcfunction and breath tracking in tick.mcfunction

$execute facing entity @e[tag=cityTroop,team=!$(teamName),limit=1,sort=nearest,tag=!touchedBreath] eyes positioned ^ ^ ^1 rotated as @s positioned ^ ^ ^2 facing entity @s eyes facing ^ ^ ^-1 positioned as @s run tp @s ^ ^ ^1 ~ ~
$damage @e[team=!$(teamName),distance=..2,limit=1,sort=nearest] 4 minecraft:dragon_breath by @p[team=$(teamName)]
