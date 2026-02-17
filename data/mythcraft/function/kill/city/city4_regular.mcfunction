data modify storage mythcraft:temp cityName set value "City4"
data modify storage mythcraft:temp advancementName set value "city4_regular"
data modify storage mythcraft:temp troopCategory set value "regular"
data modify storage mythcraft:temp cityDisplayName set from storage mythcraft:config cities.City4.name
function mythcraft:kill/killcity with storage mythcraft:temp
