# Deal 1 player-attributed burn damage (called every 20 ticks from fireburntick)
# in_fire damage type has no knockback; "by @p" attributes kills for advancements
scoreboard players set @s _fbSubTick 0
execute if entity @s[tag=_fbTeam1] run damage @s 1 minecraft:in_fire by @p[team=Team1]
execute if entity @s[tag=_fbTeam2] run damage @s 1 minecraft:in_fire by @p[team=Team2]
