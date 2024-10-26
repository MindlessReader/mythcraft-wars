execute as @s[tag=breath_ownerroyals] run function mythcraft:spells/breathseekroyals
execute as @s[tag=breath_ownerdruids] run function mythcraft:spells/breathseekdruids
execute at @s run tag @n[tag=cityTroop,tag=!touchedBreath,distance=..1] add touchedBreath
#
particle minecraft:dragon_breath ~ ~ ~ 0.1 0.1 0.1 0.03 6 normal
scoreboard players add @s SpellBreathLifetime 1
execute if score @s SpellBreathLifetime matches 120 run function mythcraft:spells/breathend
