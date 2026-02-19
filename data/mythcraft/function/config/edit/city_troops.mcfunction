# Reads which troop types are in this city's pools and opens the troop type editor
# Params: $(cityId), $(cityNum)

# Default all to false (stored as strings so macro substitution produces bare true/false keywords for dialog initial:)
data modify storage mythcraft:temp hasPillager set value "false"
data modify storage mythcraft:temp hasVindicator set value "false"
data modify storage mythcraft:temp hasZombie set value "false"
data modify storage mythcraft:temp hasSkeleton set value "false"
data modify storage mythcraft:temp hasWitch set value "false"
data modify storage mythcraft:temp hasHusk set value "false"
data modify storage mythcraft:temp hasParched set value "false"
data modify storage mythcraft:temp hasStray set value "false"
data modify storage mythcraft:temp hasSlime set value "false"
data modify storage mythcraft:temp hasBogged set value "false"
data modify storage mythcraft:temp hasPiglin set value "false"
data modify storage mythcraft:temp hasBosszombie set value "false"
data modify storage mythcraft:temp hasBossskeleton set value "false"
data modify storage mythcraft:temp hasBosswitch set value "false"
data modify storage mythcraft:temp hasBlaze set value "false"
data modify storage mythcraft:temp hasBreeze set value "false"
data modify storage mythcraft:temp hasIllusioner set value "false"
data modify storage mythcraft:temp hasWitherskeleton set value "false"
data modify storage mythcraft:temp hasEvoker set value "false"
data modify storage mythcraft:temp hasPiglinbrute set value "false"
data modify storage mythcraft:temp hasBossslime set value "false"

# Check regular pool (array-contains matching)
$execute if data storage mythcraft:config {cities:{$(cityId):{regularPool:["pillager"]}}} run data modify storage mythcraft:temp hasPillager set value "true"
$execute if data storage mythcraft:config {cities:{$(cityId):{regularPool:["vindicator"]}}} run data modify storage mythcraft:temp hasVindicator set value "true"
$execute if data storage mythcraft:config {cities:{$(cityId):{regularPool:["zombie"]}}} run data modify storage mythcraft:temp hasZombie set value "true"
$execute if data storage mythcraft:config {cities:{$(cityId):{regularPool:["skeleton"]}}} run data modify storage mythcraft:temp hasSkeleton set value "true"
$execute if data storage mythcraft:config {cities:{$(cityId):{regularPool:["witch"]}}} run data modify storage mythcraft:temp hasWitch set value "true"
$execute if data storage mythcraft:config {cities:{$(cityId):{regularPool:["husk"]}}} run data modify storage mythcraft:temp hasHusk set value "true"
$execute if data storage mythcraft:config {cities:{$(cityId):{regularPool:["parched"]}}} run data modify storage mythcraft:temp hasParched set value "true"
$execute if data storage mythcraft:config {cities:{$(cityId):{regularPool:["stray"]}}} run data modify storage mythcraft:temp hasStray set value "true"
$execute if data storage mythcraft:config {cities:{$(cityId):{regularPool:["slime"]}}} run data modify storage mythcraft:temp hasSlime set value "true"
$execute if data storage mythcraft:config {cities:{$(cityId):{regularPool:["bogged"]}}} run data modify storage mythcraft:temp hasBogged set value "true"
$execute if data storage mythcraft:config {cities:{$(cityId):{regularPool:["piglin"]}}} run data modify storage mythcraft:temp hasPiglin set value "true"

# Check boss pool
$execute if data storage mythcraft:config {cities:{$(cityId):{bossPool:["bosszombie"]}}} run data modify storage mythcraft:temp hasBosszombie set value "true"
$execute if data storage mythcraft:config {cities:{$(cityId):{bossPool:["bossskeleton"]}}} run data modify storage mythcraft:temp hasBossskeleton set value "true"
$execute if data storage mythcraft:config {cities:{$(cityId):{bossPool:["bosswitch"]}}} run data modify storage mythcraft:temp hasBosswitch set value "true"
$execute if data storage mythcraft:config {cities:{$(cityId):{bossPool:["blaze"]}}} run data modify storage mythcraft:temp hasBlaze set value "true"
$execute if data storage mythcraft:config {cities:{$(cityId):{bossPool:["breeze"]}}} run data modify storage mythcraft:temp hasBreeze set value "true"
$execute if data storage mythcraft:config {cities:{$(cityId):{bossPool:["illusioner"]}}} run data modify storage mythcraft:temp hasIllusioner set value "true"
$execute if data storage mythcraft:config {cities:{$(cityId):{bossPool:["witherskeleton"]}}} run data modify storage mythcraft:temp hasWitherskeleton set value "true"
$execute if data storage mythcraft:config {cities:{$(cityId):{bossPool:["evoker"]}}} run data modify storage mythcraft:temp hasEvoker set value "true"
$execute if data storage mythcraft:config {cities:{$(cityId):{bossPool:["piglinbrute"]}}} run data modify storage mythcraft:temp hasPiglinbrute set value "true"
$execute if data storage mythcraft:config {cities:{$(cityId):{bossPool:["bossslime"]}}} run data modify storage mythcraft:temp hasBossslime set value "true"

$data modify storage mythcraft:temp cityId set value "$(cityId)"
$data modify storage mythcraft:temp cityNum set value "$(cityNum)"
function mythcraft:config/show/city_troops with storage mythcraft:temp
