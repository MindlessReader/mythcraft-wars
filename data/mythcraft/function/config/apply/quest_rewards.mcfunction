# Rebuilds quest reward pool from checkbox state
# Params: $(golden_apple), $(ender_pearls), $(wind_charges), $(strength_powder), $(harming_potions),
#         $(trident), $(invis_kelp), $(wind_arrows), $(levitation_arrows), $(poison_potions), $(regen_tear),
#         $(buff_resistance), $(buff_speed), $(buff_health_boost), $(buff_strength)

# Store checkbox values in temp as raw booleans (dialog sends true/false -> SNBT parses to 1b/0b)
$data modify storage mythcraft:temp golden_apple set value $(golden_apple)
$data modify storage mythcraft:temp ender_pearls set value $(ender_pearls)
$data modify storage mythcraft:temp wind_charges set value $(wind_charges)
$data modify storage mythcraft:temp strength_powder set value $(strength_powder)
$data modify storage mythcraft:temp harming_potions set value $(harming_potions)
$data modify storage mythcraft:temp trident set value $(trident)
$data modify storage mythcraft:temp invis_kelp set value $(invis_kelp)
$data modify storage mythcraft:temp wind_arrows set value $(wind_arrows)
$data modify storage mythcraft:temp levitation_arrows set value $(levitation_arrows)
$data modify storage mythcraft:temp poison_potions set value $(poison_potions)
$data modify storage mythcraft:temp regen_tear set value $(regen_tear)
$data modify storage mythcraft:temp buff_resistance set value $(buff_resistance)
$data modify storage mythcraft:temp buff_speed set value $(buff_speed)
$data modify storage mythcraft:temp buff_health_boost set value $(buff_health_boost)
$data modify storage mythcraft:temp buff_strength set value $(buff_strength)

# Rebuild quest pool
# Note: macro substitution strips type suffixes (true->1b->"1"), so check {key:1} not {key:true}
data modify storage mythcraft:config rewards.questPool set value []
execute if data storage mythcraft:temp {golden_apple:1} run data modify storage mythcraft:config rewards.questPool append value "golden_apple"
execute if data storage mythcraft:temp {ender_pearls:1} run data modify storage mythcraft:config rewards.questPool append value "ender_pearls"
execute if data storage mythcraft:temp {wind_charges:1} run data modify storage mythcraft:config rewards.questPool append value "wind_charges"
execute if data storage mythcraft:temp {strength_powder:1} run data modify storage mythcraft:config rewards.questPool append value "strength_powder"
execute if data storage mythcraft:temp {harming_potions:1} run data modify storage mythcraft:config rewards.questPool append value "harming_potions"
execute if data storage mythcraft:temp {trident:1} run data modify storage mythcraft:config rewards.questPool append value "trident"
execute if data storage mythcraft:temp {invis_kelp:1} run data modify storage mythcraft:config rewards.questPool append value "invis_kelp"
execute if data storage mythcraft:temp {wind_arrows:1} run data modify storage mythcraft:config rewards.questPool append value "wind_arrows"
execute if data storage mythcraft:temp {levitation_arrows:1} run data modify storage mythcraft:config rewards.questPool append value "levitation_arrows"
execute if data storage mythcraft:temp {poison_potions:1} run data modify storage mythcraft:config rewards.questPool append value "poison_potions"
execute if data storage mythcraft:temp {regen_tear:1} run data modify storage mythcraft:config rewards.questPool append value "regen_tear"
execute if data storage mythcraft:temp {buff_resistance:1} run data modify storage mythcraft:config rewards.questPool append value "buff_resistance"
execute if data storage mythcraft:temp {buff_speed:1} run data modify storage mythcraft:config rewards.questPool append value "buff_speed"
execute if data storage mythcraft:temp {buff_health_boost:1} run data modify storage mythcraft:config rewards.questPool append value "buff_health_boost"
execute if data storage mythcraft:temp {buff_strength:1} run data modify storage mythcraft:config rewards.questPool append value "buff_strength"

tellraw @s {text:"Quest reward pool saved!",color:"green"}

# Return to config menu
function mythcraft:config/open
