# Process manual conquer submission
# Params: $(cityId), $(playerName)
$data modify storage mythcraft:temp cityId set value "$(cityId)"
$data modify storage mythcraft:temp playerName set value "$(playerName)"
$data modify storage mythcraft:temp cityDisplayName set from storage mythcraft:config cities.$(cityId).name
function mythcraft:admin/conquer/try_conquer with storage mythcraft:temp
