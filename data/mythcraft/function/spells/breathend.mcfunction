execute as @e[tag=breath_ownerteam2] as @e[team=!Team2,distance=..6] run damage @s 10 minecraft:dragon_breath by @p[team=Team2]
execute as @e[tag=breath_ownerteam1] as @e[team=!Team1,distance=..6] run damage @s 10 minecraft:dragon_breath by @p[team=Team1]
tag @e[tag=cityTroop,tag=touchedBreath] remove touchedBreath
particle minecraft:dragon_breath ~ ~ ~ 1 1 1 0.5 25 normal
kill @s
