# Resolve city display name and owning team's color for teleport announcement
# Macro: $(cityId) — e.g., "City1"
$data modify storage mythcraft:temp announce.locationName set from storage mythcraft:config cities.$(cityId).name
$execute if score $(cityId) cityOwnership matches 0 run data modify storage mythcraft:temp announce.locationColor set from storage mythcraft:config teams.Unaligned.color
$execute if score $(cityId) cityOwnership matches 1 run data modify storage mythcraft:temp announce.locationColor set from storage mythcraft:config teams.Team1.color
$execute if score $(cityId) cityOwnership matches 2 run data modify storage mythcraft:temp announce.locationColor set from storage mythcraft:config teams.Team2.color
