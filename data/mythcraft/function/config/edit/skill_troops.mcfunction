# Reads which troop types are in this skill location's pools and opens the editor
# Params: $(skill)

# Default all to false (stored as strings so macro substitution produces bare true/false keywords for dialog initial:)
data modify storage mythcraft:temp hasPillager set value "false"
data modify storage mythcraft:temp hasVindicator set value "false"
data modify storage mythcraft:temp hasZombie set value "false"
data modify storage mythcraft:temp hasSkeleton set value "false"
data modify storage mythcraft:temp hasWitch set value "false"
data modify storage mythcraft:temp hasBosszombie set value "false"
data modify storage mythcraft:temp hasBossskeleton set value "false"
data modify storage mythcraft:temp hasBosswitch set value "false"
data modify storage mythcraft:temp hasBlaze set value "false"
data modify storage mythcraft:temp hasBreeze set value "false"
data modify storage mythcraft:temp hasIllusioner set value "false"

# Check regular pool (array-contains matching)
$execute if data storage mythcraft:config {skillLocations:{$(skill):{regularPool:["pillager"]}}} run data modify storage mythcraft:temp hasPillager set value "true"
$execute if data storage mythcraft:config {skillLocations:{$(skill):{regularPool:["vindicator"]}}} run data modify storage mythcraft:temp hasVindicator set value "true"
$execute if data storage mythcraft:config {skillLocations:{$(skill):{regularPool:["zombie"]}}} run data modify storage mythcraft:temp hasZombie set value "true"
$execute if data storage mythcraft:config {skillLocations:{$(skill):{regularPool:["skeleton"]}}} run data modify storage mythcraft:temp hasSkeleton set value "true"
$execute if data storage mythcraft:config {skillLocations:{$(skill):{regularPool:["witch"]}}} run data modify storage mythcraft:temp hasWitch set value "true"

# Check boss pool
$execute if data storage mythcraft:config {skillLocations:{$(skill):{bossPool:["bosszombie"]}}} run data modify storage mythcraft:temp hasBosszombie set value "true"
$execute if data storage mythcraft:config {skillLocations:{$(skill):{bossPool:["bossskeleton"]}}} run data modify storage mythcraft:temp hasBossskeleton set value "true"
$execute if data storage mythcraft:config {skillLocations:{$(skill):{bossPool:["bosswitch"]}}} run data modify storage mythcraft:temp hasBosswitch set value "true"
$execute if data storage mythcraft:config {skillLocations:{$(skill):{bossPool:["blaze"]}}} run data modify storage mythcraft:temp hasBlaze set value "true"
$execute if data storage mythcraft:config {skillLocations:{$(skill):{bossPool:["breeze"]}}} run data modify storage mythcraft:temp hasBreeze set value "true"
$execute if data storage mythcraft:config {skillLocations:{$(skill):{bossPool:["illusioner"]}}} run data modify storage mythcraft:temp hasIllusioner set value "true"

$data modify storage mythcraft:temp skill set value "$(skill)"
function mythcraft:config/show/skill_troops with storage mythcraft:temp
