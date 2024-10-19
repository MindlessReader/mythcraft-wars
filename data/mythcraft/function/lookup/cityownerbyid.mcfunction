# parameters for location id and scoreboard, stores location name at supplied path. path should match format "Player scoreboard"
$scoreboard players set Temp mathCounter $(id)

$execute if score Temp mathCounter = Celak locationId run scoreboard players operation $(locationPath) = Celak cityOwnership
$execute if score Temp mathCounter = Kings-Port locationId run scoreboard players operation $(locationPath) = Kings-Port cityOwnership
$execute if score Temp mathCounter = Athens locationId run scoreboard players operation $(locationPath) = Athens cityOwnership
$execute if score Temp mathCounter = Delphi locationId run scoreboard players operation $(locationPath) = Delphi cityOwnership
$execute if score Temp mathCounter = Povertane locationId run scoreboard players operation $(locationPath) = Povertane cityOwnership
$execute if score Temp mathCounter = Amnis locationId run scoreboard players operation $(locationPath) = Amnis cityOwnership
$execute if score Temp mathCounter = Fronteria locationId run scoreboard players operation $(locationPath) = Fronteria cityOwnership