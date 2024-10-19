# parameters for location id and data storage path, stores location name at supplied path. path should match format "mythcraft:path/path variablename"
$scoreboard players set Temp mathCounter $(id)

$execute if score Temp mathCounter matches 3 run data modify storage $(locationPath) set value "Athens"
$execute if score Temp mathCounter matches 4 run data modify storage $(locationPath) set value "Delphi"
$execute if score Temp mathCounter matches 5 run data modify storage $(locationPath) set value "Povertane"
$execute if score Temp mathCounter matches 6 run data modify storage $(locationPath) set value "Amnis"
$execute if score Temp mathCounter matches 7 run data modify storage $(locationPath) set value "Fronteria"
$execute if score Temp mathCounter matches 8 run data modify storage $(locationPath) set value "Colosseum"
$execute if score Temp mathCounter matches 9 run data modify storage $(locationPath) set value "Fort-Reference"
$execute if score Temp mathCounter matches 10 run data modify storage $(locationPath) set value "Thoth-University"
$execute if score Temp mathCounter matches 11 run data modify storage $(locationPath) set value "Athena-Library"