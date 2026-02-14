# Check if team skill XP has reached new level thresholds
# Takes $(locationName) macro parameter (Attack, Defense, Magic, Special)
# Mimics character/checklevel.mcfunction pattern but for team-level skills

# Team1 - store previous level, check all thresholds with >=, trigger effects if changed
$execute store result score _Team1 _prevSkillLevel run scoreboard players get Team1 level$(locationName)

$execute if score Team1 level$(locationName) matches ..0 if score Team1 xp$(locationName) >= Threshold1 xpThresholds run scoreboard players set Team1 level$(locationName) 1
$execute if score Team1 level$(locationName) matches ..1 if score Team1 xp$(locationName) >= Threshold2 xpThresholds run scoreboard players set Team1 level$(locationName) 2
$execute if score Team1 level$(locationName) matches ..2 if score Team1 xp$(locationName) >= Threshold3 xpThresholds run scoreboard players set Team1 level$(locationName) 3
$execute if score Team1 level$(locationName) matches ..3 if score Team1 xp$(locationName) >= Threshold4 xpThresholds run scoreboard players set Team1 level$(locationName) 4
$execute if score Team1 level$(locationName) matches ..4 if score Team1 xp$(locationName) >= Threshold5 xpThresholds run scoreboard players set Team1 level$(locationName) 5

$execute unless score Team1 level$(locationName) = _Team1 _prevSkillLevel as @p[team=Team1] run function mythcraft:leveling/skills/levelup {locationName: $(locationName)}

# Team2 - store previous level, check all thresholds with >=, trigger effects if changed
$execute store result score _Team2 _prevSkillLevel run scoreboard players get Team2 level$(locationName)

$execute if score Team2 level$(locationName) matches ..0 if score Team2 xp$(locationName) >= Threshold1 xpThresholds run scoreboard players set Team2 level$(locationName) 1
$execute if score Team2 level$(locationName) matches ..1 if score Team2 xp$(locationName) >= Threshold2 xpThresholds run scoreboard players set Team2 level$(locationName) 2
$execute if score Team2 level$(locationName) matches ..2 if score Team2 xp$(locationName) >= Threshold3 xpThresholds run scoreboard players set Team2 level$(locationName) 3
$execute if score Team2 level$(locationName) matches ..3 if score Team2 xp$(locationName) >= Threshold4 xpThresholds run scoreboard players set Team2 level$(locationName) 4
$execute if score Team2 level$(locationName) matches ..4 if score Team2 xp$(locationName) >= Threshold5 xpThresholds run scoreboard players set Team2 level$(locationName) 5

$execute unless score Team2 level$(locationName) = _Team2 _prevSkillLevel as @p[team=Team2] run function mythcraft:leveling/skills/levelup {locationName: $(locationName)}
