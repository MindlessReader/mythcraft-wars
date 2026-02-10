data modify storage mythcraft:temp cityName set value "City5"
data modify storage mythcraft:temp callbackName set value "city5"
data modify storage mythcraft:temp cityDisplayName set from storage mythcraft:config cities.City5.name
function mythcraft:respawn/attemptrespawn with storage mythcraft:temp
