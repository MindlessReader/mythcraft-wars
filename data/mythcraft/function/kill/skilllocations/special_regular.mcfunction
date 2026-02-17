data modify storage mythcraft:temp locationName set value "Special"
data modify storage mythcraft:temp advancementName set value "special_regular"
data modify storage mythcraft:temp troopCategory set value "regular"
data modify storage mythcraft:temp locationDisplayName set from storage mythcraft:config skillLocations.Special.name
function mythcraft:kill/killskillloc with storage mythcraft:temp
