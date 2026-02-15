# LEGACY SYSTEM - Dragon's Breath spell (replaced by Fireball)
# Preserved for potential future use or reference
# To re-enable: uncomment dragon_breath line in rekit.mcfunction and breath tracking in tick.mcfunction

execute as @s[tag=breath_ownerteam2] run function mythcraft:spells/breathseekteam {teamName:Team2}
execute as @s[tag=breath_ownerteam1] run function mythcraft:spells/breathseekteam {teamName:Team1}
execute at @s run tag @n[tag=cityTroop,tag=!touchedBreath,distance=..1] add touchedBreath
#
particle minecraft:dragon_breath ~ ~ ~ 0.1 0.1 0.1 0.03 6 normal
scoreboard players add @s _spellLifetime 1
execute if score @s _spellLifetime matches 120 run function mythcraft:spells/breathend
