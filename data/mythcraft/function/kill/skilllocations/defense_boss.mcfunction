data modify storage mythcraft:temp locationName set value "Defense"
data modify storage mythcraft:temp advancementName set value "defense_boss"
data modify storage mythcraft:temp troopCategory set value "boss"
data modify storage mythcraft:temp locationDisplayName set from storage mythcraft:config skillLocations.Defense.name
function mythcraft:kill/killskillloc with storage mythcraft:temp
