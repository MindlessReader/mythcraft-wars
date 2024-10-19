tag @a remove wonLastQuest

# subtract from quests remaining
scoreboard players remove QuestTracker questsRemaining 1

# start next quest
execute if score QuestTracker questsRemaining matches 1.. run schedule function mythcraft:quests/startquest 10s
execute if score QuestTracker questsRemaining matches 0 run schedule function mythcraft:endgame 10s

# end function early if winner was already handled due to attackers winning a conquer quest
execute if score QuestTracker questType matches 1 if score QuestTracker questWinner matches 1.. run return 1

# conquer quest defense winner calculator; if attackers won, winner was handled immediately via conquer event (conquerquestattackreward.mcfunction), not here
execute if score QuestTracker questType matches 1 if score QuestTracker questWinner matches 0 if score QuestTracker questLocationOwner matches 1..2 run scoreboard players operation QuestTracker questWinner = QuestTracker questLocationOwner

# kill quest winner calculator
execute if score Druids questKills > Royals questKills run scoreboard players set QuestTracker questWinner 1
execute if score Druids questKills < Royals questKills run scoreboard players set QuestTracker questWinner 2

# announce winner
execute if score QuestTracker questWinner matches 1 run tellraw @a [{"bold":true,"color":"dark_purple","text":"Quest End: "}, {"color":"green","text":"Druids"}, {"color":"white","text":" won the quest!"}]
execute if score QuestTracker questWinner matches 2 run tellraw @a [{"bold":true,"color":"dark_purple","text":"Quest End: "}, {"color":"blue","text":"Royals"}, {"color":"white","text":" won the quest!"}]

# kill quest winner calculator
execute if score QuestTracker questType matches 2 if score Druids questKills > Royals questKills run scoreboard players set QuestTracker questWinner 1
execute if score QuestTracker questType matches 2 if score Druids questKills < Royals questKills run scoreboard players set QuestTracker questWinner 2

function mythcraft:quests/rewards/grant/master