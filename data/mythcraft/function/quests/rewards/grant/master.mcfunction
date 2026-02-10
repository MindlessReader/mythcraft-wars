# add tag to winning players
execute if score QuestTracker questWinner matches 1 run tag @a[team=Team1] add wonLastQuest
execute if score QuestTracker questWinner matches 2 run tag @a[team=Team2] add wonLastQuest

execute as @a[tag=wonLastQuest] at @s run playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~

# grant rewards
execute if score QuestTracker questRewardType matches 1 run function mythcraft:quests/rewards/grant/item
execute if score QuestTracker questRewardType matches 2 run function mythcraft:quests/rewards/grant/buff
execute if score QuestTracker questRewardType matches 3 run function mythcraft:quests/rewards/grant/victorypoint