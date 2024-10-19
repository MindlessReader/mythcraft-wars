# function called when a team conquers a city for a quest
#{cityName:$(cityName), teamId:$(teamId), teamName:$(teamName)}

# set winner
$scoreboard players set QuestTracker questWinner $(teamId)

# grant reward
function mythcraft:quests/rewards/grant/master

# announce
execute if score QuestTracker questWinner matches 1 run tellraw @a [{"bold":true,"color":"dark_purple","text":"Quest End: "}, {"color":"green","text":"Druids"}, {"color":"white","text":" won the quest!"}]
execute if score QuestTracker questWinner matches 2 run tellraw @a [{"bold":true,"color":"dark_purple","text":"Quest End: "}, {"color":"blue","text":"Royals"}, {"color":"white","text":" won the quest!"}]

