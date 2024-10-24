execute as @e[tag=breath_ownerroyals] as @e[team=!Royals,distance=..6] run damage @s 8 minecraft:dragon_breath by @p[team=Royals]
execute as @e[tag=breath_ownerdruids] as @e[team=!Druids,distance=..6] run damage @s 8 minecraft:dragon_breath by @p[team=Druids]
tag @e[tag=cityTroop,tag=touchedBreath] remove touchedBreath
particle minecraft:dragon_breath ~ ~ ~ 0.5 0.5 0.5 1 18 normal
kill @s