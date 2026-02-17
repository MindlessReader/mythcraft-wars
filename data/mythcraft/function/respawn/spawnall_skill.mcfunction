# Full spawn for skill locations: kill existing troops and spawn one troop per marker
# Params: $(locationName), $(locationId)

# Kill all existing troops
$execute as @e[type=!marker,tag=cityTroop,tag=$(locationName)] run tp ~ -100 ~
$kill @e[type=!marker,tag=cityTroop,tag=$(locationName)]

# Load pools from skill location config
$data modify storage mythcraft:temp regularPool set from storage mythcraft:config skillLocations.$(locationId).regularPool
$data modify storage mythcraft:temp bossPool set from storage mythcraft:config skillLocations.$(locationId).bossPool
$data modify storage mythcraft:temp cityName set value "$(locationName)"
data modify storage mythcraft:temp teamName set value "Unaligned"
$data modify storage mythcraft:temp cityDisplayName set from storage mythcraft:config skillLocations.$(locationId).name

# Spawn one random regular troop at each regular marker
$execute as @e[type=marker,tag=spawnmarker_regular,tag=$(locationName)] at @s run function mythcraft:respawn/pick_regular

# Spawn one random boss troop at each boss marker
$execute as @e[type=marker,tag=spawnmarker_boss,tag=$(locationName)] at @s run function mythcraft:respawn/pick_boss

# Apply slowness
$effect give @e[tag=cityTroop,tag=$(locationName)] slowness infinite 9 true
