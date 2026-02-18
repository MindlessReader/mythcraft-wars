# Reads which raid boss types are in this skill location's pool and opens the editor
# Params: $(skill)

# Default all to false
data modify storage mythcraft:temp hasGiantSlime set value "false"
data modify storage mythcraft:temp hasWarden set value "false"
data modify storage mythcraft:temp hasTheTwins set value "false"

# Check raid boss pool (array-contains matching)
$execute if data storage mythcraft:config {skillLocations:{$(skill):{raidBossPool:["giant_slime"]}}} run data modify storage mythcraft:temp hasGiantSlime set value "true"
$execute if data storage mythcraft:config {skillLocations:{$(skill):{raidBossPool:["warden"]}}} run data modify storage mythcraft:temp hasWarden set value "true"
$execute if data storage mythcraft:config {skillLocations:{$(skill):{raidBossPool:["the_twins"]}}} run data modify storage mythcraft:temp hasTheTwins set value "true"

$data modify storage mythcraft:temp skill set value "$(skill)"
function mythcraft:config/show/skill_raidboss with storage mythcraft:temp
