# Read city display name and open username input
# Params: $(cityId), $(cityNum)
$data modify storage mythcraft:temp cityDisplayName set from storage mythcraft:config cities.$(cityId).name
$data modify storage mythcraft:temp cityId set value "$(cityId)"
$data modify storage mythcraft:temp cityNum set value "$(cityNum)"
function mythcraft:admin/conquer/show_city with storage mythcraft:temp
