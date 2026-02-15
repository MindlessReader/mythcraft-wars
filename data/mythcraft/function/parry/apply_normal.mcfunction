# Macro helper: reflect damage to nearest non-allied entity (no debuff)
# Tag valid targets (enemy players + enemy troops), then hit the nearest one
$tag @a[team=!$(myTeam),distance=..5] add parryTarget
$tag @e[tag=cityTroop,team=!$(myTeam),distance=..5] add parryTarget
$damage @e[tag=parryTarget,distance=..5,sort=nearest,limit=1] $(dmg) minecraft:thorns by @s
tag @e[tag=parryTarget] remove parryTarget
