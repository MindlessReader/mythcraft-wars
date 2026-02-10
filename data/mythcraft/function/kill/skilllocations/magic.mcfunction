data modify storage mythcraft:temp locationName set value "Magic"
data modify storage mythcraft:temp advancementName set value "magic"
data modify storage mythcraft:temp locationDisplayName set from storage mythcraft:config skillLocations.Magic.name
function mythcraft:kill/killskillloc with storage mythcraft:temp
