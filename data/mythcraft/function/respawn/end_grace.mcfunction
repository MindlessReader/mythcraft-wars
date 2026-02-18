# Remove grace period invulnerability from city troops
# Params: $(cityId)

# Remove invulnerability and tag
$execute as @e[tag=_gracePeriod,tag=$(cityId)] run data merge entity @s {Invulnerable:0b}
$tag @e[tag=_gracePeriod,tag=$(cityId)] remove _gracePeriod

# Debug logging
$execute if entity @a[tag=debugMode] run say [DEBUG] Grace period ended: $(cityId)
