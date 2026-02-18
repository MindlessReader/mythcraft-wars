# Reads current game timing settings and opens the game settings editor dialog
data modify storage mythcraft:temp currentQuestCount set from storage mythcraft:config game.questCount
data modify storage mythcraft:temp currentQuestDuration set from storage mythcraft:config game.questDuration
data modify storage mythcraft:temp currentBetweenQuestDelay set from storage mythcraft:config game.betweenQuestDelay
data modify storage mythcraft:temp currentPreGameDuration set from storage mythcraft:config game.preGameDuration
data modify storage mythcraft:temp currentEndgameDuration set from storage mythcraft:config game.endgameDuration
data modify storage mythcraft:temp currentVPQuestCount set from storage mythcraft:config game.vpQuestCount
data modify storage mythcraft:temp currentRegenCheckInterval set from storage mythcraft:config game.regenCheckInterval
data modify storage mythcraft:temp currentRegenInterval set from storage mythcraft:config game.regenInterval
data modify storage mythcraft:temp currentSkillRegenInterval set from storage mythcraft:config game.skillRegenInterval
data modify storage mythcraft:temp currentGracePeriodDuration set from storage mythcraft:config game.gracePeriodDuration
function mythcraft:config/show/game with storage mythcraft:temp
