data modify storage mythcraft:temp locationName set value "Attack"
data modify storage mythcraft:temp advancementName set value "attack"
data modify storage mythcraft:temp locationDisplayName set from storage mythcraft:config skillLocations.Attack.name
function mythcraft:kill/killskillloc with storage mythcraft:temp
