# Sync actual troop entities to scoreboard counts for a city
# Params: $(cityName), $(cityId)
# Skips if city chunks aren't fully loaded (marker count != config cap)

# Load validation — check regular marker count matches troopCap (skip check if troopCap is 0)
$execute store result score _regularMarkers mathCounter if entity @e[type=marker,tag=spawnmarker_regular,tag=$(cityName)]
$execute if score $(cityName) troopCap matches 1.. unless score _regularMarkers mathCounter = $(cityName) troopCap if entity @a[tag=debugMode] run say [DEBUG] Sync $(cityName): skipped — regular markers != troopCap
$execute if score $(cityName) troopCap matches 1.. unless score _regularMarkers mathCounter = $(cityName) troopCap run return 0

# Boss validation — only check if bossCap > 0
$execute store result score _bossMarkers mathCounter if entity @e[type=marker,tag=spawnmarker_boss,tag=$(cityName)]
$execute if score $(cityName) bossCap matches 1.. unless score _bossMarkers mathCounter = $(cityName) bossCap if entity @a[tag=debugMode] run say [DEBUG] Sync $(cityName): skipped — boss markers != bossCap
$execute if score $(cityName) bossCap matches 1.. unless score _bossMarkers mathCounter = $(cityName) bossCap run return 0

# Resolve team name from ownership
$data modify storage mythcraft:temp cityName set value "$(cityName)"
$data modify storage mythcraft:temp cityId set value "$(cityId)"
data modify storage mythcraft:temp teamName set value "Unaligned"
$execute if score $(cityName) cityOwnership matches 1 run data modify storage mythcraft:temp teamName set value "Team1"
$execute if score $(cityName) cityOwnership matches 2 run data modify storage mythcraft:temp teamName set value "Team2"
$data modify storage mythcraft:temp cityDisplayName set from storage mythcraft:config cities.$(cityId).name

# Full respawn if regen completed (regenActive=2: wipe all troops, spawn fresh for even distribution)
$execute if score $(cityName) regenActive matches 2 run function mythcraft:respawn/spawnall with storage mythcraft:temp
$execute if score $(cityName) regenActive matches 2 if entity @a[tag=debugMode] run say [DEBUG] Sync $(cityName): full respawn (regen complete)
$execute if score $(cityName) regenActive matches 2 run scoreboard players set $(cityName) regenActive 0

# Count actual alive entities
$execute store result score _actualRegular mathCounter if entity @e[type=!marker,tag=cityTroop,tag=regularTroop,tag=$(cityName)]
$execute store result score _actualBoss mathCounter if entity @e[type=!marker,tag=cityTroop,tag=bossTroop,tag=$(cityName)]

# --- Regular troop sync ---
$scoreboard players operation _deficit mathCounter = $(cityName) troopCount
scoreboard players operation _deficit mathCounter -= _actualRegular mathCounter

# Spawn missing regulars
$execute if score _deficit mathCounter matches 1.. if entity @a[tag=debugMode] run say [DEBUG] Sync $(cityName): regular deficit — spawning troops
$execute if score _deficit mathCounter matches 1.. run data modify storage mythcraft:temp regularPool set from storage mythcraft:config cities.$(cityId).regularPool
execute if score _deficit mathCounter matches 1.. run data modify storage mythcraft:temp poolType set value "regular"
execute if score _deficit mathCounter matches 1.. run scoreboard players operation _spawnRemaining mathCounter = _deficit mathCounter
execute if score _deficit mathCounter matches 1.. run function mythcraft:respawn/spawn_loop with storage mythcraft:temp

# Kill one excess regular per pass if needed
$execute if score _deficit mathCounter matches ..-1 if entity @a[tag=debugMode] run say [DEBUG] Sync $(cityName): regular excess — killing one
$execute if score _deficit mathCounter matches ..-1 as @e[type=!marker,tag=cityTroop,tag=regularTroop,tag=$(cityName),sort=random,limit=1] run kill @s

# --- Boss troop sync ---
$scoreboard players operation _deficit mathCounter = $(cityName) bossCount
scoreboard players operation _deficit mathCounter -= _actualBoss mathCounter

# Spawn missing bosses
$execute if score _deficit mathCounter matches 1.. if entity @a[tag=debugMode] run say [DEBUG] Sync $(cityName): boss deficit — spawning troops
$execute if score _deficit mathCounter matches 1.. run data modify storage mythcraft:temp bossPool set from storage mythcraft:config cities.$(cityId).bossPool
execute if score _deficit mathCounter matches 1.. run data modify storage mythcraft:temp poolType set value "boss"
execute if score _deficit mathCounter matches 1.. run scoreboard players operation _spawnRemaining mathCounter = _deficit mathCounter
execute if score _deficit mathCounter matches 1.. run function mythcraft:respawn/spawn_loop with storage mythcraft:temp

# Kill one excess boss per pass if needed
$execute if score _deficit mathCounter matches ..-1 if entity @a[tag=debugMode] run say [DEBUG] Sync $(cityName): boss excess — killing one
$execute if score _deficit mathCounter matches ..-1 as @e[type=!marker,tag=cityTroop,tag=bossTroop,tag=$(cityName),sort=random,limit=1] run kill @s

# Apply slowness to all troops (newly spawned won't have it)
$effect give @e[tag=cityTroop,tag=$(cityName)] slowness infinite 9 true
