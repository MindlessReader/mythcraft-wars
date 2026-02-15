# Reset all mortar-related scores for all players (including offline)
scoreboard players reset * mortarCooldown
scoreboard players reset * _crossbowLoaded
scoreboard players reset * _mortarLoaded
scoreboard players set @a mortarCooldown 0
scoreboard players set @a _crossbowLoaded 0
scoreboard players set @a _mortarLoaded 0

# Kill all lingering mortar entities
kill @e[type=marker,tag=mortarTracker]
kill @e[type=marker,tag=mortarField]
kill @e[type=firework_rocket,tag=mortarProjectile]
