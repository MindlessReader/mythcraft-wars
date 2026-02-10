data modify storage mythcraft:temp cityName set value "City7"
data modify storage mythcraft:temp callbackName set value "city7"
data modify storage mythcraft:temp cityDisplayName set from storage mythcraft:config cities.City7.name
function mythcraft:respawn/attemptrespawn with storage mythcraft:temp
