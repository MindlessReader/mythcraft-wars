# subtract from victory point quests remaining
scoreboard players remove QuestTracker victoryPointQuestsRemaining 1

# grant victory point
execute if score QuestTracker questWinner matches 1 run scoreboard players add Druids victoryPoints 1
execute if score QuestTracker questWinner matches 2 run scoreboard players add Royals victoryPoints 1

tag @a remove wonLastQuest