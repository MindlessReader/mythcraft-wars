# Reads current team config and opens the team editor dialog
# Called with: {teamId:Team1, teamNum:1}
$data modify storage mythcraft:temp teamId set value "$(teamId)"
$data modify storage mythcraft:temp teamNum set value "$(teamNum)"
$data modify storage mythcraft:temp currentName set from storage mythcraft:config teams.$(teamId).name
$data modify storage mythcraft:temp currentColor set from storage mythcraft:config teams.$(teamId).color
$data modify storage mythcraft:temp currentTrimMaterial set from storage mythcraft:config teams.$(teamId).trimMaterial
$data modify storage mythcraft:temp currentTrimPatternHead set from storage mythcraft:config teams.$(teamId).trimPatternHead
$data modify storage mythcraft:temp currentTrimPattern set from storage mythcraft:config teams.$(teamId).trimPattern
function mythcraft:config/show/team with storage mythcraft:temp
