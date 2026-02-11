# Read current teleport coordinates for a location
# Macro params: $(path) e.g. "cities.City1" or "skillLocations.Attack", $(locName)

# Set defaults first (in case teleport data doesn't exist yet in config)
data modify storage mythcraft:temp currentX set value 0
data modify storage mythcraft:temp currentY set value 64
data modify storage mythcraft:temp currentZ set value 0
data modify storage mythcraft:temp currentYaw set value 0
data modify storage mythcraft:temp currentPitch set value 0

# Override with actual values if they exist (silently fails if path missing)
$data modify storage mythcraft:temp currentX set from storage mythcraft:config $(path).teleport.x
$data modify storage mythcraft:temp currentY set from storage mythcraft:config $(path).teleport.y
$data modify storage mythcraft:temp currentZ set from storage mythcraft:config $(path).teleport.z
$data modify storage mythcraft:temp currentYaw set from storage mythcraft:config $(path).teleport.yaw
$data modify storage mythcraft:temp currentPitch set from storage mythcraft:config $(path).teleport.pitch
$data modify storage mythcraft:temp path set value "$(path)"
$data modify storage mythcraft:temp locName set value "$(locName)"
function mythcraft:config/show/teleport with storage mythcraft:temp