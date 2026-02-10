# Colors a city's sidebar entry by joining its display name to a team
# Parameters: $(cityId), $(teamName)
$data modify storage mythcraft:temp displayName set from storage mythcraft:config cities.$(cityId).name
$data modify storage mythcraft:temp teamName set value "$(teamName)"
function mythcraft:setup/sidebar_color_apply with storage mythcraft:temp
