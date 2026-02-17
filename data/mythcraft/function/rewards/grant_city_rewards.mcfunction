# Grant all item + equipment rewards from a city's reward pool to @s
# Params: $(cityId) — e.g. "City1"
# Buffs are NOT handled here — they use the permanent ownership system (update_city_buffs)

# Item rewards
$execute if data storage mythcraft:config {cities:{$(cityId):{rewardPool:["golden_apple"]}}} run function mythcraft:rewards/apply/golden_apple
$execute if data storage mythcraft:config {cities:{$(cityId):{rewardPool:["ender_pearls"]}}} run function mythcraft:rewards/apply/ender_pearls
$execute if data storage mythcraft:config {cities:{$(cityId):{rewardPool:["wind_charges"]}}} run function mythcraft:rewards/apply/wind_charges
$execute if data storage mythcraft:config {cities:{$(cityId):{rewardPool:["strength_powder"]}}} run function mythcraft:rewards/apply/strength_powder
$execute if data storage mythcraft:config {cities:{$(cityId):{rewardPool:["harming_potions"]}}} run function mythcraft:rewards/apply/harming_potions
$execute if data storage mythcraft:config {cities:{$(cityId):{rewardPool:["trident"]}}} run function mythcraft:rewards/apply/trident
$execute if data storage mythcraft:config {cities:{$(cityId):{rewardPool:["invis_kelp"]}}} run function mythcraft:rewards/apply/invis_kelp
$execute if data storage mythcraft:config {cities:{$(cityId):{rewardPool:["wind_arrows"]}}} run function mythcraft:rewards/apply/wind_arrows
$execute if data storage mythcraft:config {cities:{$(cityId):{rewardPool:["levitation_arrows"]}}} run function mythcraft:rewards/apply/levitation_arrows
$execute if data storage mythcraft:config {cities:{$(cityId):{rewardPool:["poison_potions"]}}} run function mythcraft:rewards/apply/poison_potions
$execute if data storage mythcraft:config {cities:{$(cityId):{rewardPool:["regen_tear"]}}} run function mythcraft:rewards/apply/regen_tear

# Equipment rewards
$execute if data storage mythcraft:config {cities:{$(cityId):{rewardPool:["nourishing_bread"]}}} run function mythcraft:rewards/apply/nourishing_bread
