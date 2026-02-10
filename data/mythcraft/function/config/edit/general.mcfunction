# Reads current general settings and opens the general editor dialog
data modify storage mythcraft:temp currentTiebreak set from storage mythcraft:config tiebreakCity
function mythcraft:config/show/general with storage mythcraft:temp
