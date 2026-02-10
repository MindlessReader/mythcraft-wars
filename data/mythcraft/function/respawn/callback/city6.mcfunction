data modify storage mythcraft:temp cityName set value "City6"
data modify storage mythcraft:temp callbackName set value "city6"
data modify storage mythcraft:temp cityDisplayName set from storage mythcraft:config cities.City6.name
function mythcraft:respawn/attemptrespawn with storage mythcraft:temp
