# Applies city config changes from the dialog
# Parameters: $(cityId), $(name), $(vp)
$data modify storage mythcraft:config cities.$(cityId).name set value "$(name)"
# Convert VP to int (number_range may return float)
$data modify storage mythcraft:temp vpTemp set value $(vp)
$execute store result storage mythcraft:config cities.$(cityId).vpValue int 1 run data get storage mythcraft:temp vpTemp 1
# Navigate back to cities menu
function mythcraft:config/show/cities_menu
