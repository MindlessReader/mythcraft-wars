# Gather quest history data and show the quest history dialog
# Uses recursive loop to support any quest count

# Reset trigger
scoreboard players set @s openMenu 0

# Get total quest count from config
execute store result score _questCount mathCounter run data get storage mythcraft:config game.questCount

# Compute completed quests: questCount - questsRemaining
scoreboard players operation _completedQuests mathCounter = _questCount mathCounter
scoreboard players operation _completedQuests mathCounter -= QuestTracker questsRemaining

# Store for dialog title
execute store result storage mythcraft:temp completedQuests int 1 run scoreboard players get _completedQuests mathCounter
execute store result storage mythcraft:temp totalQuests int 1 run scoreboard players get _questCount mathCounter

# Initialize empty body array for the loop to populate
data modify storage mythcraft:temp historyBody set value [""]

# Run recursive loop (builds historyBody array entry by entry)
scoreboard players set _loopIdx mathCounter 0
execute if score _questCount mathCounter matches 1.. run function mythcraft:menu/questhistory_loop

# Show the dialog
function mythcraft:menu/questhistory_show with storage mythcraft:temp
