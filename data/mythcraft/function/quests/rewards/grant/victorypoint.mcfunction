# subtract from victory point quests remaining
scoreboard players remove QuestTracker victoryPointQuestsRemaining 1

# grant victory point
execute if score QuestTracker questWinner matches 1 run scoreboard players add Team1 victoryPoints 1
execute if score QuestTracker questWinner matches 2 run scoreboard players add Team2 victoryPoints 1

# update display
scoreboard players operation @a[team=Team1] victoryPoints = Team1 victoryPoints
scoreboard players operation @a[team=Team2] victoryPoints = Team2 victoryPoints

# update boss bar
execute as @a run bossbar set mythcraft:victorypointsbar players @s
data modify storage mythcraft:temp team1Name set from storage mythcraft:config teams.Team1.name
data modify storage mythcraft:temp team1Color set from storage mythcraft:config teams.Team1.color
data modify storage mythcraft:temp team2Name set from storage mythcraft:config teams.Team2.name
data modify storage mythcraft:temp team2Color set from storage mythcraft:config teams.Team2.color
function mythcraft:setup/bossbar with storage mythcraft:temp

# tag remove
tag @a remove wonLastQuest
