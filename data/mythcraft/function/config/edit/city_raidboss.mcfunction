# Reads which raid boss types are in this city's pool and opens the raid boss editor
# Params: $(cityId), $(cityNum)

# Default all to false (stored as strings so macro substitution produces bare true/false for dialog initial:)
data modify storage mythcraft:temp hasGiantSlime set value "false"

# Check raid boss pool (array-contains matching)
$execute if data storage mythcraft:config {cities:{$(cityId):{raidBossPool:["giant_slime"]}}} run data modify storage mythcraft:temp hasGiantSlime set value "true"

$data modify storage mythcraft:temp cityId set value "$(cityId)"
$data modify storage mythcraft:temp cityNum set value "$(cityNum)"
function mythcraft:config/show/city_raidboss with storage mythcraft:temp
