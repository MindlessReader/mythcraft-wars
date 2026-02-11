# Reads current skill location name and opens the editor
# Macro params: $(skill) e.g. "Attack"
$data modify storage mythcraft:temp currentName set from storage mythcraft:config skillLocations.$(skill).name
$data modify storage mythcraft:temp skill set value "$(skill)"
function mythcraft:config/show/skill with storage mythcraft:temp