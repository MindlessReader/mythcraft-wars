# Sync actual troop entities to scoreboard counts for a skill location
# Params: $(locationName), $(locationId)
# Skips if chunks aren't loaded (marker count != cap)

# Load validation — check regular marker count matches troopCap (skip if troopCap is 0)
$execute store result score _regularMarkers mathCounter if entity @e[type=marker,tag=spawnmarker_regular,tag=$(locationName)]
$execute if score $(locationName) troopCap matches 1.. unless score _regularMarkers mathCounter = $(locationName) troopCap if entity @a[tag=debugMode] run say [DEBUG] Sync $(locationName): skipped — regular markers != troopCap
$execute if score $(locationName) troopCap matches 1.. unless score _regularMarkers mathCounter = $(locationName) troopCap run return 0

# Load validation — check boss marker count matches bossCap (skip if bossCap is 0)
$execute store result score _bossMarkers mathCounter if entity @e[type=marker,tag=spawnmarker_boss,tag=$(locationName)]
$execute if score $(locationName) bossCap matches 1.. unless score _bossMarkers mathCounter = $(locationName) bossCap if entity @a[tag=debugMode] run say [DEBUG] Sync $(locationName): skipped — boss markers != bossCap
$execute if score $(locationName) bossCap matches 1.. unless score _bossMarkers mathCounter = $(locationName) bossCap run return 0

# Set up temp for spawning
$data modify storage mythcraft:temp cityName set value "$(locationName)"
$data modify storage mythcraft:temp cityId set value "$(locationId)"
data modify storage mythcraft:temp teamName set value "Unaligned"
$data modify storage mythcraft:temp cityDisplayName set from storage mythcraft:config skillLocations.$(locationId).name

# --- Regular troop sync ---
$execute store result score _actualRegular mathCounter if entity @e[type=!marker,tag=cityTroop,tag=regularTroop,tag=$(locationName)]

# Calculate deficit
$scoreboard players operation _deficit mathCounter = $(locationName) troopCount
scoreboard players operation _deficit mathCounter -= _actualRegular mathCounter

# Spawn missing regulars
$execute if score _deficit mathCounter matches 1.. if entity @a[tag=debugMode] run say [DEBUG] Sync $(locationName): regular deficit — spawning troops
$execute if score _deficit mathCounter matches 1.. run data modify storage mythcraft:temp regularPool set from storage mythcraft:config skillLocations.$(locationId).regularPool
execute if score _deficit mathCounter matches 1.. run data modify storage mythcraft:temp poolType set value "regular"
execute if score _deficit mathCounter matches 1.. run scoreboard players operation _spawnRemaining mathCounter = _deficit mathCounter
execute if score _deficit mathCounter matches 1.. run function mythcraft:respawn/spawn_loop with storage mythcraft:temp

# Kill one excess per pass if needed
$execute if score _deficit mathCounter matches ..-1 if entity @a[tag=debugMode] run say [DEBUG] Sync $(locationName): regular excess — killing one
$execute if score _deficit mathCounter matches ..-1 as @e[type=!marker,tag=cityTroop,tag=regularTroop,tag=$(locationName),sort=random,limit=1] run kill @s

# --- Boss troop sync ---
$execute store result score _actualBoss mathCounter if entity @e[type=!marker,tag=cityTroop,tag=bossTroop,tag=$(locationName)]

# Calculate deficit
$scoreboard players operation _deficit mathCounter = $(locationName) bossCount
scoreboard players operation _deficit mathCounter -= _actualBoss mathCounter

# Spawn missing bosses
$execute if score _deficit mathCounter matches 1.. if entity @a[tag=debugMode] run say [DEBUG] Sync $(locationName): boss deficit — spawning troops
$execute if score _deficit mathCounter matches 1.. run data modify storage mythcraft:temp bossPool set from storage mythcraft:config skillLocations.$(locationId).bossPool
execute if score _deficit mathCounter matches 1.. run data modify storage mythcraft:temp poolType set value "boss"
execute if score _deficit mathCounter matches 1.. run scoreboard players operation _spawnRemaining mathCounter = _deficit mathCounter
execute if score _deficit mathCounter matches 1.. run function mythcraft:respawn/spawn_loop with storage mythcraft:temp

# Kill one excess per pass if needed
$execute if score _deficit mathCounter matches ..-1 if entity @a[tag=debugMode] run say [DEBUG] Sync $(locationName): boss excess — killing one
$execute if score _deficit mathCounter matches ..-1 as @e[type=!marker,tag=cityTroop,tag=bossTroop,tag=$(locationName),sort=random,limit=1] run kill @s

# Apply slowness
$effect give @e[tag=cityTroop,tag=$(locationName)] slowness infinite 9 true
