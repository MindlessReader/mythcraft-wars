data modify storage mythcraft:temp cityName set value "City3"
data modify storage mythcraft:temp advancementName set value "city3_boss"
data modify storage mythcraft:temp troopCategory set value "boss"
data modify storage mythcraft:temp cityDisplayName set from storage mythcraft:config cities.City3.name
function mythcraft:kill/killcity with storage mythcraft:temp
