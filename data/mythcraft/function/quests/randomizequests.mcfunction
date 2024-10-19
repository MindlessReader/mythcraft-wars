# randomizes the number of victory point quests planned for the course of the game, can be 4 or 6
execute store result score QuestTracker victoryPointQuestsRemaining run function mythcraft:getrandomnumber {max:2}
scoreboard players operation QuestTracker victoryPointQuestsRemaining += QuestTracker victoryPointQuestsRemaining
scoreboard players add QuestTracker victoryPointQuestsRemaining 2