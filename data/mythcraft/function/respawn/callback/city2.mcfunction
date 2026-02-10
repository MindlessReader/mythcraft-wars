data modify storage mythcraft:temp cityName set value "City2"
data modify storage mythcraft:temp callbackName set value "city2"
data modify storage mythcraft:temp cityDisplayName set from storage mythcraft:config cities.City2.name
function mythcraft:respawn/attemptrespawn with storage mythcraft:temp
