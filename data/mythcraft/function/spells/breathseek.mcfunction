execute as @e[tag=breath_ownerroyals] run function mythcraft:spells/breathseekroyals
execute as @e[tag=breath_ownerdruids] run function mythcraft:spells/breathseekdruids
tag @e[tag=cityTroop,tag=!touchedBreath,distance=..1] add touchedBreath
#
particle minecraft:dragon_breath ~ ~ ~ 0.0 0.0 0.0 0.1 2 normal
scoreboard players add @s SpellBreathLifetime 1
execute if score @s SpellBreathLifetime matches 120 run function mythcraft:spells/breathend