# add buff timers to players
execute if score QuestTracker questReward matches 1 run scoreboard players add @a[tag=wonLastQuest] BuffResistance 300
execute if score QuestTracker questReward matches 2 run scoreboard players add @a[tag=wonLastQuest] BuffSpeed 300
execute if score QuestTracker questReward matches 3 run scoreboard players add @a[tag=wonLastQuest] BuffHealthBoost 300
execute if score QuestTracker questReward matches 4 run scoreboard players add @a[tag=wonLastQuest] BuffStrength 300

#call buff applicator as all players with wonLastQuest (also called in the rekit)
execute as @a[tag=wonLastQuest] run function mythcraft:applybuffs

tag @a remove wonLastQuest