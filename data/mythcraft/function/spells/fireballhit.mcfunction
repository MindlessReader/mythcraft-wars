#Visual effects
particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 0 1 force
particle minecraft:flame ~ ~ ~ 1.5 1.5 1.5 0.2 50 normal
particle minecraft:large_smoke ~ ~ ~ 1 1 1 0.1 20 normal
playsound minecraft:entity.generic.explode master @a ~ ~ ~ 3 1

#Team1 damage and burn by level
#Level 1: 3.0 blocks, 6 damage, 5 seconds burn (100 ticks)
execute as @s[tag=fireball_ownerteam1] if score @s levelMagic matches 1 as @e[team=!Team1,distance=..3.0] run damage @s 6 minecraft:fireball by @p[team=Team1]
execute as @s[tag=fireball_ownerteam1] if score @s levelMagic matches 1 as @e[team=!Team1,distance=..3.0] run function mythcraft:spells/fireballapplyburn {ticks:100,team:"_fbTeam1"}

#Level 2: 3.5 blocks, 8 damage, 7 seconds burn (140 ticks)
execute as @s[tag=fireball_ownerteam1] if score @s levelMagic matches 2 as @e[team=!Team1,distance=..3.5] run damage @s 8 minecraft:fireball by @p[team=Team1]
execute as @s[tag=fireball_ownerteam1] if score @s levelMagic matches 2 as @e[team=!Team1,distance=..3.5] run function mythcraft:spells/fireballapplyburn {ticks:140,team:"_fbTeam1"}

#Level 3: 4.0 blocks, 10 damage, 9 seconds burn (180 ticks)
execute as @s[tag=fireball_ownerteam1] if score @s levelMagic matches 3 as @e[team=!Team1,distance=..4.0] run damage @s 10 minecraft:fireball by @p[team=Team1]
execute as @s[tag=fireball_ownerteam1] if score @s levelMagic matches 3 as @e[team=!Team1,distance=..4.0] run function mythcraft:spells/fireballapplyburn {ticks:180,team:"_fbTeam1"}

#Level 4: 4.5 blocks, 12 damage, 11 seconds burn (220 ticks)
execute as @s[tag=fireball_ownerteam1] if score @s levelMagic matches 4 as @e[team=!Team1,distance=..4.5] run damage @s 12 minecraft:fireball by @p[team=Team1]
execute as @s[tag=fireball_ownerteam1] if score @s levelMagic matches 4 as @e[team=!Team1,distance=..4.5] run function mythcraft:spells/fireballapplyburn {ticks:220,team:"_fbTeam1"}

#Level 5: 5.0 blocks, 14 damage, 13 seconds burn (260 ticks)
execute as @s[tag=fireball_ownerteam1] if score @s levelMagic matches 5 as @e[team=!Team1,distance=..5.0] run damage @s 14 minecraft:fireball by @p[team=Team1]
execute as @s[tag=fireball_ownerteam1] if score @s levelMagic matches 5 as @e[team=!Team1,distance=..5.0] run function mythcraft:spells/fireballapplyburn {ticks:260,team:"_fbTeam1"}

#Team2 damage and burn by level
#Level 1: 3.0 blocks, 6 damage, 5 seconds burn (100 ticks)
execute as @s[tag=fireball_ownerteam2] if score @s levelMagic matches 1 as @e[team=!Team2,distance=..3.0] run damage @s 6 minecraft:fireball by @p[team=Team2]
execute as @s[tag=fireball_ownerteam2] if score @s levelMagic matches 1 as @e[team=!Team2,distance=..3.0] run function mythcraft:spells/fireballapplyburn {ticks:100,team:"_fbTeam2"}

#Level 2: 3.5 blocks, 8 damage, 7 seconds burn (140 ticks)
execute as @s[tag=fireball_ownerteam2] if score @s levelMagic matches 2 as @e[team=!Team2,distance=..3.5] run damage @s 8 minecraft:fireball by @p[team=Team2]
execute as @s[tag=fireball_ownerteam2] if score @s levelMagic matches 2 as @e[team=!Team2,distance=..3.5] run function mythcraft:spells/fireballapplyburn {ticks:140,team:"_fbTeam2"}

#Level 3: 4.0 blocks, 10 damage, 9 seconds burn (180 ticks)
execute as @s[tag=fireball_ownerteam2] if score @s levelMagic matches 3 as @e[team=!Team2,distance=..4.0] run damage @s 10 minecraft:fireball by @p[team=Team2]
execute as @s[tag=fireball_ownerteam2] if score @s levelMagic matches 3 as @e[team=!Team2,distance=..4.0] run function mythcraft:spells/fireballapplyburn {ticks:180,team:"_fbTeam2"}

#Level 4: 4.5 blocks, 12 damage, 11 seconds burn (220 ticks)
execute as @s[tag=fireball_ownerteam2] if score @s levelMagic matches 4 as @e[team=!Team2,distance=..4.5] run damage @s 12 minecraft:fireball by @p[team=Team2]
execute as @s[tag=fireball_ownerteam2] if score @s levelMagic matches 4 as @e[team=!Team2,distance=..4.5] run function mythcraft:spells/fireballapplyburn {ticks:220,team:"_fbTeam2"}

#Level 5: 5.0 blocks, 14 damage, 13 seconds burn (260 ticks)
execute as @s[tag=fireball_ownerteam2] if score @s levelMagic matches 5 as @e[team=!Team2,distance=..5.0] run damage @s 14 minecraft:fireball by @p[team=Team2]
execute as @s[tag=fireball_ownerteam2] if score @s levelMagic matches 5 as @e[team=!Team2,distance=..5.0] run function mythcraft:spells/fireballapplyburn {ticks:260,team:"_fbTeam2"}

#Remove collision tags and kill projectile
tag @e[tag=fireballTarget] remove fireballTarget
kill @s
