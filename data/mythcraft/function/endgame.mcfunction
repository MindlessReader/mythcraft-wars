# Disable enableTroops
tag @a remove enableTroops

# Calculate victory points from config vpValues
data modify storage mythcraft:temp cityId set value "City1"
data modify storage mythcraft:temp vpValue set from storage mythcraft:config cities.City1.vpValue
function mythcraft:endgame_addvp with storage mythcraft:temp

data modify storage mythcraft:temp cityId set value "City2"
data modify storage mythcraft:temp vpValue set from storage mythcraft:config cities.City2.vpValue
function mythcraft:endgame_addvp with storage mythcraft:temp

data modify storage mythcraft:temp cityId set value "City3"
data modify storage mythcraft:temp vpValue set from storage mythcraft:config cities.City3.vpValue
function mythcraft:endgame_addvp with storage mythcraft:temp

data modify storage mythcraft:temp cityId set value "City4"
data modify storage mythcraft:temp vpValue set from storage mythcraft:config cities.City4.vpValue
function mythcraft:endgame_addvp with storage mythcraft:temp

data modify storage mythcraft:temp cityId set value "City5"
data modify storage mythcraft:temp vpValue set from storage mythcraft:config cities.City5.vpValue
function mythcraft:endgame_addvp with storage mythcraft:temp

data modify storage mythcraft:temp cityId set value "City6"
data modify storage mythcraft:temp vpValue set from storage mythcraft:config cities.City6.vpValue
function mythcraft:endgame_addvp with storage mythcraft:temp

data modify storage mythcraft:temp cityId set value "City7"
data modify storage mythcraft:temp vpValue set from storage mythcraft:config cities.City7.vpValue
function mythcraft:endgame_addvp with storage mythcraft:temp

execute if score Team1 victoryPoints = Team2 victoryPoints if score City3 cityOwnership matches 1 run scoreboard players add Team1 victoryPoints 1
execute if score Team1 victoryPoints = Team2 victoryPoints if score City3 cityOwnership matches 2 run scoreboard players add Team2 victoryPoints 1

# resolve display names for announcements
data modify storage mythcraft:temp team1Name set from storage mythcraft:config teams.Team1.name
data modify storage mythcraft:temp team1Color set from storage mythcraft:config teams.Team1.color
data modify storage mythcraft:temp team2Name set from storage mythcraft:config teams.Team2.name
data modify storage mythcraft:temp team2Color set from storage mythcraft:config teams.Team2.color
data modify storage mythcraft:temp tiebreakCityName set from storage mythcraft:config cities.City3.name
function mythcraft:endgame_announce with storage mythcraft:temp
