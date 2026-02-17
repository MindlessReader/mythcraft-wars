# Rebuilds raid boss pool from checkbox state for a skill location
# Params: $(skill), $(giant_slime)

$data modify storage mythcraft:temp giant_slime set value $(giant_slime)

$data modify storage mythcraft:config skillLocations.$(skill).raidBossPool set value []
$execute if data storage mythcraft:temp {giant_slime:1} run data modify storage mythcraft:config skillLocations.$(skill).raidBossPool append value "giant_slime"

# Return to skill editor
$function mythcraft:config/edit/skill {skill:$(skill)}
