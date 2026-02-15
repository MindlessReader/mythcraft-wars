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

# switch actionbar from quest info to next-quest countdown
# add 10s for the gap between endquest and next quest start, so the countdown is seamless
schedule clear mythcraft:quests/actionbar
scoreboard players add QuestTracker questTimer 10
scoreboard players operation QuestTracker questTimerMin = QuestTracker questTimer
scoreboard players operation QuestTracker questTimerMin /= C_60 mathCounter
scoreboard players operation QuestTracker questTimerSec = QuestTracker questTimer
scoreboard players operation QuestTracker questTimerSec %= C_60 mathCounter
function mythcraft:quests/nextquest_actionbar
