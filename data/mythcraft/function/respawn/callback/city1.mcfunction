data modify storage mythcraft:temp cityName set value "City1"
data modify storage mythcraft:temp callbackName set value "city1"
data modify storage mythcraft:temp cityDisplayName set from storage mythcraft:config cities.City1.name
function mythcraft:respawn/attemptrespawn with storage mythcraft:temp
