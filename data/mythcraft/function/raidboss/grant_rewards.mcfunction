# Grant ALL enabled rewards from the raid boss reward pool to @s
# Called as each player on the winning team

# Item rewards
execute if data storage mythcraft:config {rewards:{raidBossPool:["golden_apple"]}} run function mythcraft:rewards/apply/golden_apple
execute if data storage mythcraft:config {rewards:{raidBossPool:["ender_pearls"]}} run function mythcraft:rewards/apply/ender_pearls
execute if data storage mythcraft:config {rewards:{raidBossPool:["wind_charges"]}} run function mythcraft:rewards/apply/wind_charges
execute if data storage mythcraft:config {rewards:{raidBossPool:["strength_powder"]}} run function mythcraft:rewards/apply/strength_powder
execute if data storage mythcraft:config {rewards:{raidBossPool:["harming_potions"]}} run function mythcraft:rewards/apply/harming_potions
execute if data storage mythcraft:config {rewards:{raidBossPool:["trident"]}} run function mythcraft:rewards/apply/trident
execute if data storage mythcraft:config {rewards:{raidBossPool:["invis_kelp"]}} run function mythcraft:rewards/apply/invis_kelp
execute if data storage mythcraft:config {rewards:{raidBossPool:["wind_arrows"]}} run function mythcraft:rewards/apply/wind_arrows
execute if data storage mythcraft:config {rewards:{raidBossPool:["levitation_arrows"]}} run function mythcraft:rewards/apply/levitation_arrows
execute if data storage mythcraft:config {rewards:{raidBossPool:["poison_potions"]}} run function mythcraft:rewards/apply/poison_potions
execute if data storage mythcraft:config {rewards:{raidBossPool:["regen_tear"]}} run function mythcraft:rewards/apply/regen_tear

# Buff rewards
execute if data storage mythcraft:config {rewards:{raidBossPool:["buff_resistance"]}} run effect give @s minecraft:resistance 300 0
execute if data storage mythcraft:config {rewards:{raidBossPool:["buff_speed"]}} run effect give @s minecraft:speed 300 0
execute if data storage mythcraft:config {rewards:{raidBossPool:["buff_health_boost"]}} run effect give @s minecraft:health_boost 300 1
execute if data storage mythcraft:config {rewards:{raidBossPool:["buff_strength"]}} run effect give @s minecraft:strength 300 0

# Equipment rewards
execute if data storage mythcraft:config {rewards:{raidBossPool:["nourishing_bread"]}} run function mythcraft:rewards/apply/nourishing_bread
