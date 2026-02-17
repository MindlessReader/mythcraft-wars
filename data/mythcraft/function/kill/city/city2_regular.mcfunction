data modify storage mythcraft:temp cityName set value "City2"
data modify storage mythcraft:temp advancementName set value "city2_regular"
data modify storage mythcraft:temp rewardFunction set value "city2"
data modify storage mythcraft:temp troopCategory set value "regular"
data modify storage mythcraft:temp cityDisplayName set from storage mythcraft:config cities.City2.name
function mythcraft:kill/killcity with storage mythcraft:temp
