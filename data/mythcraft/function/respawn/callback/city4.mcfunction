data modify storage mythcraft:temp cityName set value "City4"
data modify storage mythcraft:temp callbackName set value "city4"
data modify storage mythcraft:temp cityDisplayName set from storage mythcraft:config cities.City4.name
function mythcraft:respawn/attemptrespawn with storage mythcraft:temp
