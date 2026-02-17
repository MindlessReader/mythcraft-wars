# Full spawn: kill existing troops and spawn one troop per marker
# Params: $(cityId), $(cityName), $(teamName), $(cityDisplayName)

# Kill all existing troops
$execute as @e[type=!marker,tag=cityTroop,tag=$(cityName)] run tp ~ -100 ~
$kill @e[type=!marker,tag=cityTroop,tag=$(cityName)]

# Load pools from config into temp for spawning
$data modify storage mythcraft:temp regularPool set from storage mythcraft:config cities.$(cityId).regularPool
$data modify storage mythcraft:temp bossPool set from storage mythcraft:config cities.$(cityId).bossPool
$data modify storage mythcraft:temp cityName set value "$(cityName)"
$data modify storage mythcraft:temp teamName set value "$(teamName)"
$data modify storage mythcraft:temp cityDisplayName set value "$(cityDisplayName)"

# Spawn one random regular troop at each regular marker
$execute as @e[type=marker,tag=spawnmarker_regular,tag=$(cityName)] at @s run function mythcraft:respawn/pick_regular

# Spawn one random boss troop at each boss marker (skip if no boss pool)
$execute if data storage mythcraft:config cities.$(cityId).bossPool[0] as @e[type=marker,tag=spawnmarker_boss,tag=$(cityName)] at @s run function mythcraft:respawn/pick_boss

# Apply slowness to all spawned troops (immobile until player approaches)
$effect give @e[tag=cityTroop,tag=$(cityName)] slowness infinite 9 true
