#Straight-line motion (no seeking)
tp @s ^ ^ ^0.8

#Particle trail
particle minecraft:flame ~ ~ ~ 0.1 0.1 0.1 0.05 3 normal
particle minecraft:smoke ~ ~ ~ 0.1 0.1 0.1 0.02 1 normal

#Block collision
execute unless block ~ ~ ~ #minecraft:air run function mythcraft:spells/fireballhit

#Entity collision — mobs immediately, players delayed 2 ticks to avoid self-hit while running forward
execute positioned ~-0.5 ~-0.5 ~-0.5 as @e[type=!#mythcraft:fireball_passthrough,type=!minecraft:player,tag=!fireball_spell,dx=0,dy=0,dz=0] run tag @s add fireballTarget
execute if score @s _spellLifetime matches 2.. positioned ~-0.5 ~-0.5 ~-0.5 as @a[dx=0,dy=0,dz=0] run tag @s add fireballTarget
execute if entity @e[tag=fireballTarget] run function mythcraft:spells/fireballhit

#Lifetime (200 ticks = 10 seconds) - using generic _spellLifetime scoreboard
scoreboard players add @s _spellLifetime 1
execute if score @s _spellLifetime matches 200.. run function mythcraft:spells/fireballhit
