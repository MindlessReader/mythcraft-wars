# subtract from victory point quests remaining
scoreboard players remove QuestTracker victoryPointQuestsRemaining 1

# grant victory point
execute if score QuestTracker questWinner matches 1 run scoreboard players add Druids victoryPoints 1
execute if score QuestTracker questWinner matches 2 run scoreboard players add Royals victoryPoints 1

# update display
scoreboard players operation @a[team=Druids] victoryPoints = Druids victoryPoints
scoreboard players operation @a[team=Royals] victoryPoints = Royals victoryPoints

# update boss bar
execute as @a run bossbar set mythcraft:victorypointsbar players @s
bossbar set mythcraft:victorypointsbar name [{"bold":false,"color":"blue","text":"Royals "},{"bold":true,"color":"white","score":{"name":"Royals","objective":"victoryPoints"}},{"bold":false,"color":"dark_gray","text":"-"},{"bold":true,"color":"white","score":{"name":"Druids","objective":"victoryPoints"}},{"bold":false,"color":"green","text":" Druids"}]

# tag remove
tag @a remove wonLastQuest