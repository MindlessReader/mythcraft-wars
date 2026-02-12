# generate random selection from list
execute store result score QuestTracker questReward run function mythcraft:getrandomnumber {max:4}

execute if score QuestTracker questReward matches 1 run data modify storage mythcraft:quest rewardText set value "Resistance (5:00)"
execute if score QuestTracker questReward matches 2 run data modify storage mythcraft:quest rewardText set value "Speed (5:00)"
execute if score QuestTracker questReward matches 3 run data modify storage mythcraft:quest rewardText set value "Health Boost II (5:00)"
execute if score QuestTracker questReward matches 4 run data modify storage mythcraft:quest rewardText set value "Strength (5:00)"
#execute if score QuestTracker questReward matches 
#execute if score QuestTracker questReward matches 
#execute if score QuestTracker questReward matches 
#execute if score QuestTracker questReward matches 
#execute if score QuestTracker questReward matches 
#execute if score QuestTracker questReward matches 
#execute if score QuestTracker questReward matches 
#execute if score QuestTracker questReward matches 
#execute if score QuestTracker questReward matches 
#execute if score QuestTracker questReward matches 
#execute if score QuestTracker questReward matches 
