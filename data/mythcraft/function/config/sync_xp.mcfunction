# Syncs XP threshold config values into scoreboards
# Called on every load and after config editor saves

# Character XP thresholds (levels 2-5)
execute store result score CharLvl2 characterXPThresholds run data get storage mythcraft:config xp.character.level2
execute store result score CharLvl3 characterXPThresholds run data get storage mythcraft:config xp.character.level3
execute store result score CharLvl4 characterXPThresholds run data get storage mythcraft:config xp.character.level4
execute store result score CharLvl5 characterXPThresholds run data get storage mythcraft:config xp.character.level5

# Skill XP thresholds (levels 1-5)
execute store result score Threshold1 xpThresholds run data get storage mythcraft:config xp.skill.level1
execute store result score Threshold2 xpThresholds run data get storage mythcraft:config xp.skill.level2
execute store result score Threshold3 xpThresholds run data get storage mythcraft:config xp.skill.level3
execute store result score Threshold4 xpThresholds run data get storage mythcraft:config xp.skill.level4
execute store result score Threshold5 xpThresholds run data get storage mythcraft:config xp.skill.level5
