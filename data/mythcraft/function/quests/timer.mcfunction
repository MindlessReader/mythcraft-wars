# Countdown timer for quest duration, runs every 1 second
# Decrements questTimer, computes minutes and seconds for display

scoreboard players remove QuestTracker questTimer 1

# Compute minutes: timer / 60
scoreboard players operation QuestTracker questTimerMin = QuestTracker questTimer
scoreboard players operation QuestTracker questTimerMin /= C_60 mathCounter

# Compute seconds: timer % 60
scoreboard players operation QuestTracker questTimerSec = QuestTracker questTimer
scoreboard players operation QuestTracker questTimerSec %= C_60 mathCounter

# Reschedule if timer > 0
execute if score QuestTracker questTimer matches 1.. run schedule function mythcraft:quests/timer 1s
