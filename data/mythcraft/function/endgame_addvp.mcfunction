# Add VP for a city based on config vpValue. Params: $(cityId), $(vpValue)
$execute if score $(cityId) cityOwnership matches 1 run scoreboard players add Team1 victoryPoints $(vpValue)
$execute if score $(cityId) cityOwnership matches 2 run scoreboard players add Team2 victoryPoints $(vpValue)
