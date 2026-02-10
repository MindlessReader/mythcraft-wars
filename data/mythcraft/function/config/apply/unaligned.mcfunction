# Applies Unaligned team config changes from the dialog
# Parameters: $(name), $(color)
$data modify storage mythcraft:config teams.Unaligned.name set value "$(name)"
$data modify storage mythcraft:config teams.Unaligned.color set value "$(color)"
# Navigate back to teams menu
function mythcraft:config/show/teams_menu
