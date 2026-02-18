# Applies XP threshold settings from the dialog
# Parameters: $(charLvl2), $(charLvl3), $(charLvl4), $(charLvl5), $(skillLvl1), $(skillLvl2), $(skillLvl3), $(skillLvl4), $(skillLvl5)
$data modify storage mythcraft:config xp.character.level2 set value $(charLvl2)
$data modify storage mythcraft:config xp.character.level3 set value $(charLvl3)
$data modify storage mythcraft:config xp.character.level4 set value $(charLvl4)
$data modify storage mythcraft:config xp.character.level5 set value $(charLvl5)
$data modify storage mythcraft:config xp.skill.level1 set value $(skillLvl1)
$data modify storage mythcraft:config xp.skill.level2 set value $(skillLvl2)
$data modify storage mythcraft:config xp.skill.level3 set value $(skillLvl3)
$data modify storage mythcraft:config xp.skill.level4 set value $(skillLvl4)
$data modify storage mythcraft:config xp.skill.level5 set value $(skillLvl5)
# Sync config values into scoreboards
function mythcraft:config/sync_xp
# Navigate back to main menu
function mythcraft:config/open
