# Applies team config changes from the dialog
# Parameters: $(teamId), $(name), $(color), $(trimMaterial), $(trimPatternHead), $(trimPattern)
$data modify storage mythcraft:config teams.$(teamId).name set value "$(name)"
$data modify storage mythcraft:config teams.$(teamId).color set value "$(color)"
$data modify storage mythcraft:config teams.$(teamId).trimMaterial set value "$(trimMaterial)"
$data modify storage mythcraft:config teams.$(teamId).trimPatternHead set value "$(trimPatternHead)"
$data modify storage mythcraft:config teams.$(teamId).trimPattern set value "$(trimPattern)"
# Navigate back to teams menu
function mythcraft:config/show/teams_menu
