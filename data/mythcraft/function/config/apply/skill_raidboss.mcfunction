# Rebuilds raid boss pool from checkbox state for a skill location
# Params: $(skill), $(giant_slime), $(warden), $(the_twins)

$data modify storage mythcraft:temp giant_slime set value $(giant_slime)
$data modify storage mythcraft:temp warden set value $(warden)
$data modify storage mythcraft:temp the_twins set value $(the_twins)

$data modify storage mythcraft:config skillLocations.$(skill).raidBossPool set value []
$execute if data storage mythcraft:temp {giant_slime:1} run data modify storage mythcraft:config skillLocations.$(skill).raidBossPool append value "giant_slime"
$execute if data storage mythcraft:temp {warden:1} run data modify storage mythcraft:config skillLocations.$(skill).raidBossPool append value "warden"
$execute if data storage mythcraft:temp {the_twins:1} run data modify storage mythcraft:config skillLocations.$(skill).raidBossPool append value "the_twins"

# Return to skill editor
$function mythcraft:config/edit/skill {skill:$(skill)}
