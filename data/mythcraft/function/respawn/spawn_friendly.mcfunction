# Spawn a random regular troop as a friendly-fire replacement
# Params: $(cityName), $(teamName), $(cityDisplayName)
# Does NOT change troop counts (1:1 replacement)

# Load regular pool from config into temp
$data modify storage mythcraft:temp regularPool set from storage mythcraft:config cities.$(cityName).regularPool
$data modify storage mythcraft:temp cityName set value "$(cityName)"
$data modify storage mythcraft:temp teamName set value "$(teamName)"
$data modify storage mythcraft:temp cityDisplayName set value "$(cityDisplayName)"

# Spawn at nearest unoccupied regular marker
data modify storage mythcraft:temp poolType set value "regular"
function mythcraft:respawn/spawn_at_available with storage mythcraft:temp

# Apply slowness to newly spawned troop
$effect give @e[tag=cityTroop,tag=$(cityName)] slowness infinite 9 true
