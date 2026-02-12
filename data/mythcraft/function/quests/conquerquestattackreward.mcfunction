# function called when a team conquers a city for a quest
#{cityName:$(cityName), teamId:$(teamId), teamName:$(teamName)}

# set winner
$scoreboard players set QuestTracker questWinner $(teamId)

# grant reward
function mythcraft:quests/rewards/grant/master

# announce
$function mythcraft:quests/quest_winteam {teamName:$(teamName)}

# log quest result immediately
function mythcraft:quests/logresult

# stop the quest timer
schedule clear mythcraft:quests/timer
