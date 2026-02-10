# Reads current skill location names and opens the skills editor dialog
data modify storage mythcraft:temp attackName set from storage mythcraft:config skillLocations.Attack.name
data modify storage mythcraft:temp defenseName set from storage mythcraft:config skillLocations.Defense.name
data modify storage mythcraft:temp magicName set from storage mythcraft:config skillLocations.Magic.name
data modify storage mythcraft:temp specialName set from storage mythcraft:config skillLocations.Special.name
function mythcraft:config/show/skills with storage mythcraft:temp
