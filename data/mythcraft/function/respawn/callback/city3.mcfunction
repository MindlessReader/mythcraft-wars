data modify storage mythcraft:temp cityName set value "City3"
data modify storage mythcraft:temp callbackName set value "city3"
data modify storage mythcraft:temp cityDisplayName set from storage mythcraft:config cities.City3.name
function mythcraft:respawn/attemptrespawn with storage mythcraft:temp
