# Initialize 10s "Next Quest" countdown for between-quest gap
scoreboard players set QuestTracker questTimer 10
scoreboard players set QuestTracker questTimerMin 0
scoreboard players set QuestTracker questTimerSec 10
schedule function mythcraft:quests/timer 1s
function mythcraft:quests/nextquest_actionbar
