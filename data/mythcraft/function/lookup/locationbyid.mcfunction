# parameters for location id and data storage path, stores location name at supplied path. path should match format "mythcraft:path/path variablename"
$scoreboard players set Temp mathCounter $(id)

$execute if score Temp mathCounter matches 3 run data modify storage $(locationPath) set from storage mythcraft:config cities.City3.name
$execute if score Temp mathCounter matches 4 run data modify storage $(locationPath) set from storage mythcraft:config cities.City4.name
$execute if score Temp mathCounter matches 5 run data modify storage $(locationPath) set from storage mythcraft:config cities.City5.name
$execute if score Temp mathCounter matches 6 run data modify storage $(locationPath) set from storage mythcraft:config cities.City6.name
$execute if score Temp mathCounter matches 7 run data modify storage $(locationPath) set from storage mythcraft:config cities.City7.name
$execute if score Temp mathCounter matches 8 run data modify storage $(locationPath) set from storage mythcraft:config skillLocations.Attack.name
$execute if score Temp mathCounter matches 9 run data modify storage $(locationPath) set from storage mythcraft:config skillLocations.Defense.name
$execute if score Temp mathCounter matches 10 run data modify storage $(locationPath) set from storage mythcraft:config skillLocations.Magic.name
$execute if score Temp mathCounter matches 11 run data modify storage $(locationPath) set from storage mythcraft:config skillLocations.Special.name
