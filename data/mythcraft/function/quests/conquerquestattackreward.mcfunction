# function called when a team conquers a city for a quest
#{cityName:$(cityName), teamId:$(teamId), teamName:$(teamName)}

# set winner
$scoreboard players set QuestTracker questWinner $(teamId)

# grant reward
function mythcraft:quests/rewards/grant/master

# announce
execute if score QuestTracker questWinner matches 1 run function mythcraft:quests/quest_windruids
execute if score QuestTracker questWinner matches 2 run function mythcraft:quests/quest_winroyals