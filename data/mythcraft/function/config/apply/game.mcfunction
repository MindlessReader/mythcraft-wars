# Applies game timing settings from the dialog
# Parameters: $(questCount), $(vpQuestCount), $(questDuration), $(betweenQuestDelay), $(preGameDuration), $(endgameDuration)
$data modify storage mythcraft:config game.questCount set value $(questCount)
$data modify storage mythcraft:config game.vpQuestCount set value $(vpQuestCount)
$data modify storage mythcraft:config game.questDuration set value $(questDuration)
$data modify storage mythcraft:config game.betweenQuestDelay set value $(betweenQuestDelay)
$data modify storage mythcraft:config game.preGameDuration set value $(preGameDuration)
$data modify storage mythcraft:config game.endgameDuration set value $(endgameDuration)
# Navigate back to main menu
function mythcraft:config/open
