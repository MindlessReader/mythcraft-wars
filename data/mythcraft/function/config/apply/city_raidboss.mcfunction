# Rebuilds raid boss pool from checkbox state
# Params: $(cityId), $(cityNum), $(giant_slime), $(warden), $(the_twins)

# Store checkbox values in temp as raw booleans (dialog sends true/false -> SNBT parses to 1b/0b)
$data modify storage mythcraft:temp giant_slime set value $(giant_slime)
$data modify storage mythcraft:temp warden set value $(warden)
$data modify storage mythcraft:temp the_twins set value $(the_twins)

# Rebuild raid boss pool
# Note: macro substitution strips type suffixes (true->1b->"1"), so check {key:1} not {key:true}
$data modify storage mythcraft:config cities.$(cityId).raidBossPool set value []
$execute if data storage mythcraft:temp {giant_slime:1} run data modify storage mythcraft:config cities.$(cityId).raidBossPool append value "giant_slime"
$execute if data storage mythcraft:temp {warden:1} run data modify storage mythcraft:config cities.$(cityId).raidBossPool append value "warden"
$execute if data storage mythcraft:temp {the_twins:1} run data modify storage mythcraft:config cities.$(cityId).raidBossPool append value "the_twins"

# Return to city editor
$function mythcraft:config/edit/city {cityId:$(cityId),cityNum:$(cityNum)}
