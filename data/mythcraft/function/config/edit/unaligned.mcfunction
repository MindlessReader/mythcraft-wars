# Reads current Unaligned team config and opens the editor dialog
data modify storage mythcraft:temp currentName set from storage mythcraft:config teams.Unaligned.name
data modify storage mythcraft:temp currentColor set from storage mythcraft:config teams.Unaligned.color
function mythcraft:config/show/unaligned with storage mythcraft:temp
