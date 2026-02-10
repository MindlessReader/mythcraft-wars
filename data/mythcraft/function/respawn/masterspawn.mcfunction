# Initialize all cities as Unaligned
data modify storage mythcraft:temp teamId set value 0
data modify storage mythcraft:temp teamName set value "Unaligned"

data modify storage mythcraft:temp cityId set value "City1"
data modify storage mythcraft:temp rewardFunction set value "city1"
data modify storage mythcraft:temp cityDisplayName set from storage mythcraft:config cities.City1.name
function mythcraft:conquer with storage mythcraft:temp

data modify storage mythcraft:temp cityId set value "City2"
data modify storage mythcraft:temp rewardFunction set value "city2"
data modify storage mythcraft:temp cityDisplayName set from storage mythcraft:config cities.City2.name
function mythcraft:conquer with storage mythcraft:temp

data modify storage mythcraft:temp cityId set value "City3"
data modify storage mythcraft:temp rewardFunction set value "city3"
data modify storage mythcraft:temp cityDisplayName set from storage mythcraft:config cities.City3.name
function mythcraft:conquer with storage mythcraft:temp

data modify storage mythcraft:temp cityId set value "City4"
data modify storage mythcraft:temp rewardFunction set value "city4"
data modify storage mythcraft:temp cityDisplayName set from storage mythcraft:config cities.City4.name
function mythcraft:conquer with storage mythcraft:temp

data modify storage mythcraft:temp cityId set value "City5"
data modify storage mythcraft:temp rewardFunction set value "city5"
data modify storage mythcraft:temp cityDisplayName set from storage mythcraft:config cities.City5.name
function mythcraft:conquer with storage mythcraft:temp

data modify storage mythcraft:temp cityId set value "City6"
data modify storage mythcraft:temp rewardFunction set value "city6"
data modify storage mythcraft:temp cityDisplayName set from storage mythcraft:config cities.City6.name
function mythcraft:conquer with storage mythcraft:temp

data modify storage mythcraft:temp cityId set value "City7"
data modify storage mythcraft:temp rewardFunction set value "city7"
data modify storage mythcraft:temp cityDisplayName set from storage mythcraft:config cities.City7.name
function mythcraft:conquer with storage mythcraft:temp

data modify storage mythcraft:temp cityName set value "Attack"
data modify storage mythcraft:temp teamName set value "Unaligned"
data modify storage mythcraft:temp cityDisplayName set from storage mythcraft:config skillLocations.Attack.name
function mythcraft:respawn/spawnall with storage mythcraft:temp

data modify storage mythcraft:temp cityName set value "Defense"
data modify storage mythcraft:temp cityDisplayName set from storage mythcraft:config skillLocations.Defense.name
function mythcraft:respawn/spawnall with storage mythcraft:temp

data modify storage mythcraft:temp cityName set value "Special"
data modify storage mythcraft:temp cityDisplayName set from storage mythcraft:config skillLocations.Special.name
function mythcraft:respawn/spawnall with storage mythcraft:temp

data modify storage mythcraft:temp cityName set value "Magic"
data modify storage mythcraft:temp cityDisplayName set from storage mythcraft:config skillLocations.Magic.name
function mythcraft:respawn/spawnall with storage mythcraft:temp
