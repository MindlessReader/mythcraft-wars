# Applies general settings changes from the dialog
# Parameters: $(tiebreak)
$data modify storage mythcraft:config tiebreakCity set value "$(tiebreak)"
# Navigate back to main menu
function mythcraft:config/open
