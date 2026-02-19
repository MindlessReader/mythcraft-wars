# Macro helper: reflect damage + Slowness II (3s) to nearest non-allied entity
# Tag valid targets (enemy players + enemy troops), then hit the nearest one
$tag @a[team=!$(myTeam),distance=..10] add parryTarget
$tag @e[tag=cityTroop,team=!$(myTeam),distance=..10] add parryTarget
tag @e[tag=raidBoss,distance=..10] add parryTarget
$damage @e[tag=parryTarget,distance=..10,sort=nearest,limit=1] $(dmg) minecraft:thorns by @s
effect give @e[tag=parryTarget,distance=..10,sort=nearest,limit=1] minecraft:slowness 3 1
tag @e[tag=parryTarget] remove parryTarget
