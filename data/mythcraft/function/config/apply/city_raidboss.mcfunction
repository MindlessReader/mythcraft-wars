# Rebuilds raid boss pool from checkbox state
# Params: $(cityId), $(cityNum), $(giant_slime)

# Store checkbox value in temp as raw boolean (dialog sends true/false → SNBT parses to 1b/0b)
$data modify storage mythcraft:temp giant_slime set value $(giant_slime)

# Rebuild raid boss pool
# Note: macro substitution strips type suffixes (true→1b→"1"), so check {key:1} not {key:true}
$data modify storage mythcraft:config cities.$(cityId).raidBossPool set value []
$execute if data storage mythcraft:temp {giant_slime:1} run data modify storage mythcraft:config cities.$(cityId).raidBossPool append value "giant_slime"

# Return to city editor
$function mythcraft:config/edit/city {cityId:$(cityId),cityNum:$(cityNum)}
