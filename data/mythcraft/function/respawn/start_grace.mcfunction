# Apply grace period invulnerability to all troops at a conquered city
# Params: $(cityId)

# Read grace period duration from config into scoreboard
$execute store result score $(cityId) graceTimer run data get storage mythcraft:config game.gracePeriodDuration

# Tag troops and make invulnerable
$execute as @e[type=!marker,tag=cityTroop,tag=$(cityId)] run tag @s add _gracePeriod
$execute as @e[type=!marker,tag=cityTroop,tag=$(cityId)] run data merge entity @s {Invulnerable:1b}

# Debug logging
$execute if entity @a[tag=debugMode] run say [DEBUG] Grace period started: $(cityId)

# Start grace tick loop (idempotent — safe to call if already running)
schedule function mythcraft:respawn/grace_tick 1s
