# Rebuilds troop pool lists from checkbox state for a skill location
# Params: $(skill), $(pillager), $(vindicator), $(zombie), $(skeleton), $(witch),
#         $(bosszombie), $(bossskeleton), $(bosswitch), $(blaze), $(breeze), $(illusioner)

# Store checkbox values in temp as raw booleans (dialog sends true/false → SNBT parses to 1b/0b)
$data modify storage mythcraft:temp pillager set value $(pillager)
$data modify storage mythcraft:temp vindicator set value $(vindicator)
$data modify storage mythcraft:temp zombie set value $(zombie)
$data modify storage mythcraft:temp skeleton set value $(skeleton)
$data modify storage mythcraft:temp witch set value $(witch)
$data modify storage mythcraft:temp bosszombie set value $(bosszombie)
$data modify storage mythcraft:temp bossskeleton set value $(bossskeleton)
$data modify storage mythcraft:temp bosswitch set value $(bosswitch)
$data modify storage mythcraft:temp blaze set value $(blaze)
$data modify storage mythcraft:temp breeze set value $(breeze)
$data modify storage mythcraft:temp illusioner set value $(illusioner)

# Rebuild regular pool (all lines need $ prefix because they use $(skill))
# Note: macro substitution strips type suffixes (true→1b→"1"), so check {key:1} not {key:true}
$data modify storage mythcraft:config skillLocations.$(skill).regularPool set value []
$execute if data storage mythcraft:temp {pillager:1} run data modify storage mythcraft:config skillLocations.$(skill).regularPool append value "pillager"
$execute if data storage mythcraft:temp {vindicator:1} run data modify storage mythcraft:config skillLocations.$(skill).regularPool append value "vindicator"
$execute if data storage mythcraft:temp {zombie:1} run data modify storage mythcraft:config skillLocations.$(skill).regularPool append value "zombie"
$execute if data storage mythcraft:temp {skeleton:1} run data modify storage mythcraft:config skillLocations.$(skill).regularPool append value "skeleton"
$execute if data storage mythcraft:temp {witch:1} run data modify storage mythcraft:config skillLocations.$(skill).regularPool append value "witch"

# Rebuild boss pool
$data modify storage mythcraft:config skillLocations.$(skill).bossPool set value []
$execute if data storage mythcraft:temp {bosszombie:1} run data modify storage mythcraft:config skillLocations.$(skill).bossPool append value "bosszombie"
$execute if data storage mythcraft:temp {bossskeleton:1} run data modify storage mythcraft:config skillLocations.$(skill).bossPool append value "bossskeleton"
$execute if data storage mythcraft:temp {bosswitch:1} run data modify storage mythcraft:config skillLocations.$(skill).bossPool append value "bosswitch"
$execute if data storage mythcraft:temp {blaze:1} run data modify storage mythcraft:config skillLocations.$(skill).bossPool append value "blaze"
$execute if data storage mythcraft:temp {breeze:1} run data modify storage mythcraft:config skillLocations.$(skill).bossPool append value "breeze"
$execute if data storage mythcraft:temp {illusioner:1} run data modify storage mythcraft:config skillLocations.$(skill).bossPool append value "illusioner"

# Return to skill editor
$function mythcraft:config/edit/skill {skill:$(skill)}
