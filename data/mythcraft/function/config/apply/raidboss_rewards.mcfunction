# Rebuilds raid boss reward pool from checkbox state
# Params: all 17 reward booleans (including victory_point)

# Store checkbox values in temp as raw booleans
$data modify storage mythcraft:temp victory_point set value $(victory_point)
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
$data modify storage mythcraft:temp nourishing_bread set value $(nourishing_bread)

# Rebuild raid boss reward pool
data modify storage mythcraft:config rewards.raidBossPool set value []
execute if data storage mythcraft:temp {victory_point:1} run data modify storage mythcraft:config rewards.raidBossPool append value "victory_point"
execute if data storage mythcraft:temp {golden_apple:1} run data modify storage mythcraft:config rewards.raidBossPool append value "golden_apple"
execute if data storage mythcraft:temp {ender_pearls:1} run data modify storage mythcraft:config rewards.raidBossPool append value "ender_pearls"
execute if data storage mythcraft:temp {wind_charges:1} run data modify storage mythcraft:config rewards.raidBossPool append value "wind_charges"
execute if data storage mythcraft:temp {strength_powder:1} run data modify storage mythcraft:config rewards.raidBossPool append value "strength_powder"
execute if data storage mythcraft:temp {harming_potions:1} run data modify storage mythcraft:config rewards.raidBossPool append value "harming_potions"
execute if data storage mythcraft:temp {trident:1} run data modify storage mythcraft:config rewards.raidBossPool append value "trident"
execute if data storage mythcraft:temp {invis_kelp:1} run data modify storage mythcraft:config rewards.raidBossPool append value "invis_kelp"
execute if data storage mythcraft:temp {wind_arrows:1} run data modify storage mythcraft:config rewards.raidBossPool append value "wind_arrows"
execute if data storage mythcraft:temp {levitation_arrows:1} run data modify storage mythcraft:config rewards.raidBossPool append value "levitation_arrows"
execute if data storage mythcraft:temp {poison_potions:1} run data modify storage mythcraft:config rewards.raidBossPool append value "poison_potions"
execute if data storage mythcraft:temp {regen_tear:1} run data modify storage mythcraft:config rewards.raidBossPool append value "regen_tear"
execute if data storage mythcraft:temp {buff_resistance:1} run data modify storage mythcraft:config rewards.raidBossPool append value "buff_resistance"
execute if data storage mythcraft:temp {buff_speed:1} run data modify storage mythcraft:config rewards.raidBossPool append value "buff_speed"
execute if data storage mythcraft:temp {buff_health_boost:1} run data modify storage mythcraft:config rewards.raidBossPool append value "buff_health_boost"
execute if data storage mythcraft:temp {buff_strength:1} run data modify storage mythcraft:config rewards.raidBossPool append value "buff_strength"
execute if data storage mythcraft:temp {nourishing_bread:1} run data modify storage mythcraft:config rewards.raidBossPool append value "nourishing_bread"

tellraw @s {text:"Raid boss reward pool saved!",color:"green"}

# Return to config menu
function mythcraft:config/open
