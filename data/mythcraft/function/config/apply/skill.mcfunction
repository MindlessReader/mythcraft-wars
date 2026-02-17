# Applies skill location config changes from the dialog
# Parameters: $(skill), $(name), $(troopCap), $(bossCap)
$data modify storage mythcraft:config skillLocations.$(skill).name set value "$(name)"
$data modify storage mythcraft:config skillLocations.$(skill).troopCap set value $(troopCap)
$data modify storage mythcraft:config skillLocations.$(skill).bossCap set value $(bossCap)
# Navigate back to skills menu
function mythcraft:config/show/skills_menu
