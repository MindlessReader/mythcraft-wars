# Macro helper: apply skill XP to the player's team and check for level-ups
# Params: $(locationName), $(raidBossSkillAmount)

$execute if entity @s[team=Team1] run scoreboard players add Team1 xp$(locationName) $(raidBossSkillAmount)
$execute if entity @s[team=Team2] run scoreboard players add Team2 xp$(locationName) $(raidBossSkillAmount)
$function mythcraft:leveling/skills/checklevel {locationName: $(locationName)}
