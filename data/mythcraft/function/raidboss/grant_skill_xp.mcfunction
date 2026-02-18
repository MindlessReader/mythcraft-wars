# Grant skill XP if raid boss is at a skill location
# Params: $(amount) — XP to grant to the hitting player's team
# Context: @s is the player

# Only applies to skill locations, not cities
execute unless data storage mythcraft:raidboss {cityName:"Attack"} unless data storage mythcraft:raidboss {cityName:"Defense"} unless data storage mythcraft:raidboss {cityName:"Magic"} unless data storage mythcraft:raidboss {cityName:"Special"} run return 0

$data modify storage mythcraft:temp raidBossSkillAmount set value $(amount)
data modify storage mythcraft:temp locationName set from storage mythcraft:raidboss cityName
function mythcraft:raidboss/grant_skill_xp_apply with storage mythcraft:temp
