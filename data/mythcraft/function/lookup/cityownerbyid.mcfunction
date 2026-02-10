# parameters for location id and scoreboard, stores location name at supplied path. path should match format "Player scoreboard"
$scoreboard players set Temp mathCounter $(id)

$execute if score Temp mathCounter = City1 locationId run scoreboard players operation $(locationPath) = City1 cityOwnership
$execute if score Temp mathCounter = City2 locationId run scoreboard players operation $(locationPath) = City2 cityOwnership
$execute if score Temp mathCounter = City3 locationId run scoreboard players operation $(locationPath) = City3 cityOwnership
$execute if score Temp mathCounter = City4 locationId run scoreboard players operation $(locationPath) = City4 cityOwnership
$execute if score Temp mathCounter = City5 locationId run scoreboard players operation $(locationPath) = City5 cityOwnership
$execute if score Temp mathCounter = City6 locationId run scoreboard players operation $(locationPath) = City6 cityOwnership
$execute if score Temp mathCounter = City7 locationId run scoreboard players operation $(locationPath) = City7 cityOwnership