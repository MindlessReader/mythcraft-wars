# Marker Helper: detect nearest marker and identify its location
scoreboard players set @s adminAction 0

# Block if another admin is already counting
execute if entity @a[tag=markerHelperActive] run tellraw @s [{color:"red",text:"[Admin] Marker helper is already active for another player."}]
execute if entity @a[tag=markerHelperActive] run return 0

# Clean up any previous detection tag
tag @e[type=marker,tag=_nearestMarker] remove _nearestMarker

# Tag nearest spawnmarker within 100 blocks
execute at @s run tag @e[type=marker,tag=spawnmarker,sort=nearest,limit=1,distance=..100] add _nearestMarker

# Check if any marker was found
execute unless entity @e[tag=_nearestMarker] run tellraw @s [{color:"red",text:"[Admin] No spawn marker found within 100 blocks."}]
execute unless entity @e[tag=_nearestMarker] run return 0

# Detect location by checking tags on the nearest marker
data modify storage mythcraft:admin markerLocation set value ""
data modify storage mythcraft:admin locationDisplayName set value ""

execute if entity @e[tag=_nearestMarker,tag=City1] run data modify storage mythcraft:admin markerLocation set value "City1"
execute if entity @e[tag=_nearestMarker,tag=City1] run data modify storage mythcraft:admin locationDisplayName set from storage mythcraft:config cities.City1.name
execute if entity @e[tag=_nearestMarker,tag=City2] run data modify storage mythcraft:admin markerLocation set value "City2"
execute if entity @e[tag=_nearestMarker,tag=City2] run data modify storage mythcraft:admin locationDisplayName set from storage mythcraft:config cities.City2.name
execute if entity @e[tag=_nearestMarker,tag=City3] run data modify storage mythcraft:admin markerLocation set value "City3"
execute if entity @e[tag=_nearestMarker,tag=City3] run data modify storage mythcraft:admin locationDisplayName set from storage mythcraft:config cities.City3.name
execute if entity @e[tag=_nearestMarker,tag=City4] run data modify storage mythcraft:admin markerLocation set value "City4"
execute if entity @e[tag=_nearestMarker,tag=City4] run data modify storage mythcraft:admin locationDisplayName set from storage mythcraft:config cities.City4.name
execute if entity @e[tag=_nearestMarker,tag=City5] run data modify storage mythcraft:admin markerLocation set value "City5"
execute if entity @e[tag=_nearestMarker,tag=City5] run data modify storage mythcraft:admin locationDisplayName set from storage mythcraft:config cities.City5.name
execute if entity @e[tag=_nearestMarker,tag=City6] run data modify storage mythcraft:admin markerLocation set value "City6"
execute if entity @e[tag=_nearestMarker,tag=City6] run data modify storage mythcraft:admin locationDisplayName set from storage mythcraft:config cities.City6.name
execute if entity @e[tag=_nearestMarker,tag=City7] run data modify storage mythcraft:admin markerLocation set value "City7"
execute if entity @e[tag=_nearestMarker,tag=City7] run data modify storage mythcraft:admin locationDisplayName set from storage mythcraft:config cities.City7.name
execute if entity @e[tag=_nearestMarker,tag=Attack] run data modify storage mythcraft:admin markerLocation set value "Attack"
execute if entity @e[tag=_nearestMarker,tag=Attack] run data modify storage mythcraft:admin locationDisplayName set from storage mythcraft:config skillLocations.Attack.name
execute if entity @e[tag=_nearestMarker,tag=Defense] run data modify storage mythcraft:admin markerLocation set value "Defense"
execute if entity @e[tag=_nearestMarker,tag=Defense] run data modify storage mythcraft:admin locationDisplayName set from storage mythcraft:config skillLocations.Defense.name
execute if entity @e[tag=_nearestMarker,tag=Magic] run data modify storage mythcraft:admin markerLocation set value "Magic"
execute if entity @e[tag=_nearestMarker,tag=Magic] run data modify storage mythcraft:admin locationDisplayName set from storage mythcraft:config skillLocations.Magic.name
execute if entity @e[tag=_nearestMarker,tag=Special] run data modify storage mythcraft:admin markerLocation set value "Special"
execute if entity @e[tag=_nearestMarker,tag=Special] run data modify storage mythcraft:admin locationDisplayName set from storage mythcraft:config skillLocations.Special.name

# Detect marker tier for info display
data modify storage mythcraft:admin markerTier set value "unknown"
execute if entity @e[tag=_nearestMarker,tag=spawnmarker_regular] run data modify storage mythcraft:admin markerTier set value "Regular"
execute if entity @e[tag=_nearestMarker,tag=spawnmarker_boss] run data modify storage mythcraft:admin markerTier set value "Boss"
execute if entity @e[tag=_nearestMarker,tag=spawnmarker_raidboss] run data modify storage mythcraft:admin markerTier set value "Raid Boss"

# Error: marker has no location tag
execute if data storage mythcraft:admin {markerLocation:""} run tellraw @s [{color:"red",text:"[Admin] Nearest marker has no location tag assigned."}]
execute if data storage mythcraft:admin {markerLocation:""} run tag @e[tag=_nearestMarker] remove _nearestMarker
execute if data storage mythcraft:admin {markerLocation:""} run return 0

# Show confirmation dialog
function mythcraft:admin/marker/show_confirm with storage mythcraft:admin
