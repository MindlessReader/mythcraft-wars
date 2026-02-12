# Resolve skill display name for teleport announcement (always white)
# Macro: $(skill) — e.g., "Attack"
$data modify storage mythcraft:temp announce.locationName set from storage mythcraft:config skillLocations.$(skill).name
data modify storage mythcraft:temp announce.locationColor set value "white"
