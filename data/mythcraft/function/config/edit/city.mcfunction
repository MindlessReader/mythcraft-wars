# Reads current city config and opens the city editor dialog
# Called with: {cityId:City1, cityNum:1}
$data modify storage mythcraft:temp currentName set from storage mythcraft:config cities.$(cityId).name
$data modify storage mythcraft:temp currentVp set from storage mythcraft:config cities.$(cityId).vpValue
$data modify storage mythcraft:temp cityId set value "$(cityId)"
$data modify storage mythcraft:temp cityNum set value "$(cityNum)"
function mythcraft:config/show/city with storage mythcraft:temp
