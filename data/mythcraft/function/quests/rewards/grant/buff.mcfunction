# remove all buff tags from everyone
tag @a remove BuffResistance
tag @a remove BuffSpeed

# add buff tags to winners
execute if score QuestTracker questReward matches 1 run tag @a[tag=wonLastQuest] add BuffResistance
execute if score QuestTracker questReward matches 2 run tag @a[tag=wonLastQuest] add BuffSpeed
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

#call buff applicator as all players with wonLastQuest (also called in the rekit)
execute as @a[tag=wonLastQuest] run function mythcraft:applybuffs

tag @a remove wonLastQuest