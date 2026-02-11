# Applies skill location name change from the dialog
# Parameters: $(skill), $(name)
$data modify storage mythcraft:config skillLocations.$(skill).name set value "$(name)"
# Navigate back to skills menu
function mythcraft:config/show/skills_menu