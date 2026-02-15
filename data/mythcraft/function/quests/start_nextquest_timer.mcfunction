# Initialize "Next Quest" countdown for between-quest gap (duration from config)
execute store result score QuestTracker questTimer run data get storage mythcraft:config game.betweenQuestDelay
scoreboard players operation QuestTracker questTimerMin = QuestTracker questTimer
scoreboard players operation QuestTracker questTimerMin /= C_60 mathCounter
scoreboard players operation QuestTracker questTimerSec = QuestTracker questTimer
scoreboard players operation QuestTracker questTimerSec %= C_60 mathCounter
schedule function mythcraft:quests/timer 1s
function mythcraft:quests/nextquest_actionbar
