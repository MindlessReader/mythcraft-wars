# Reads current XP threshold settings and opens the XP editor dialog
data modify storage mythcraft:temp currentCharLvl2 set from storage mythcraft:config xp.character.level2
data modify storage mythcraft:temp currentCharLvl3 set from storage mythcraft:config xp.character.level3
data modify storage mythcraft:temp currentCharLvl4 set from storage mythcraft:config xp.character.level4
data modify storage mythcraft:temp currentCharLvl5 set from storage mythcraft:config xp.character.level5
data modify storage mythcraft:temp currentSkillLvl1 set from storage mythcraft:config xp.skill.level1
data modify storage mythcraft:temp currentSkillLvl2 set from storage mythcraft:config xp.skill.level2
data modify storage mythcraft:temp currentSkillLvl3 set from storage mythcraft:config xp.skill.level3
data modify storage mythcraft:temp currentSkillLvl4 set from storage mythcraft:config xp.skill.level4
data modify storage mythcraft:temp currentSkillLvl5 set from storage mythcraft:config xp.skill.level5
function mythcraft:config/show/xp with storage mythcraft:temp
