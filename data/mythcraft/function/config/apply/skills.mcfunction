# Applies skill location name changes from the dialog
# Parameters: $(attack), $(defense), $(magic), $(special)
$data modify storage mythcraft:config skillLocations.Attack.name set value "$(attack)"
$data modify storage mythcraft:config skillLocations.Defense.name set value "$(defense)"
$data modify storage mythcraft:config skillLocations.Magic.name set value "$(magic)"
$data modify storage mythcraft:config skillLocations.Special.name set value "$(special)"
# Navigate back to main menu
function mythcraft:config/open
