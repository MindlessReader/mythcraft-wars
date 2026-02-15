# Tag this specific tracker to avoid confusion with other trackers
tag @s add _checkingTracker

# Store this tracker's ID in a temporary fake player for comparison
scoreboard players operation #TrackerID mathCounter = @s mathCounter

# Mark as not found initially
scoreboard players set @s _totemDmg 0

# Find and teleport to matching firework (using tag to ensure we modify THIS tracker only)
execute as @e[type=firework_rocket,tag=mortarProjectile] if score @s mathCounter = #TrackerID mathCounter run scoreboard players set @e[type=marker,tag=_checkingTracker,limit=1] _totemDmg 1
execute if score @s _totemDmg matches 1 as @e[type=firework_rocket,tag=mortarProjectile] if score @s mathCounter = #TrackerID mathCounter run tp @e[type=marker,tag=_checkingTracker,limit=1] @s

# Remove temporary tag
tag @s remove _checkingTracker

# If no matching firework found (exploded/gone), trigger impact
execute if score @s _totemDmg matches 0 run function mythcraft:mortar/on_impact

