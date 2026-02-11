# Get level, XP, and next-level threshold for one team skill
# Macro params: $(team), $(skill)
# Stores into mythcraft:temp: lvl$(skill), xp$(skill), thresh$(skill)

$execute store result storage mythcraft:temp lvl$(skill) int 1 run scoreboard players get $(team) level$(skill)
$execute store result storage mythcraft:temp xp$(skill) int 1 run scoreboard players get $(team) xp$(skill)

# Next level threshold based on current level
$execute if score $(team) level$(skill) matches 0 store result storage mythcraft:temp thresh$(skill) int 1 run scoreboard players get Threshold1 xpThresholds
$execute if score $(team) level$(skill) matches 1 store result storage mythcraft:temp thresh$(skill) int 1 run scoreboard players get Threshold2 xpThresholds
$execute if score $(team) level$(skill) matches 2 store result storage mythcraft:temp thresh$(skill) int 1 run scoreboard players get Threshold3 xpThresholds
$execute if score $(team) level$(skill) matches 3 store result storage mythcraft:temp thresh$(skill) int 1 run scoreboard players get Threshold4 xpThresholds
$execute if score $(team) level$(skill) matches 4 store result storage mythcraft:temp thresh$(skill) int 1 run scoreboard players get Threshold5 xpThresholds
$execute if score $(team) level$(skill) matches 5 run data modify storage mythcraft:temp thresh$(skill) set value "MAX"
