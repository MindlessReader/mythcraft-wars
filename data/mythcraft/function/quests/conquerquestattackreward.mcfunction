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

# Decrement quests remaining and schedule what comes next
# (done here instead of endquest so the actionbar sees the correct questsRemaining)
scoreboard players remove QuestTracker questsRemaining 1
data modify storage mythcraft:temp duration set from storage mythcraft:config game.betweenQuestDelay
execute if score QuestTracker questsRemaining matches 1.. run function mythcraft:schedule/startquest with storage mythcraft:temp
execute if score QuestTracker questsRemaining matches 0 run function mythcraft:schedule/beginendgame with storage mythcraft:temp

# switch actionbar from quest info to next-quest/endgame countdown
# add between-quest delay so the countdown is seamless
schedule clear mythcraft:quests/actionbar
execute store result score _betweenDelay mathCounter run data get storage mythcraft:config game.betweenQuestDelay
scoreboard players operation QuestTracker questTimer += _betweenDelay mathCounter
scoreboard players operation QuestTracker questTimerMin = QuestTracker questTimer
scoreboard players operation QuestTracker questTimerMin /= C_60 mathCounter
scoreboard players operation QuestTracker questTimerSec = QuestTracker questTimer
scoreboard players operation QuestTracker questTimerSec %= C_60 mathCounter
function mythcraft:quests/nextquest_actionbar
