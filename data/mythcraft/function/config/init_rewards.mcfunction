# Initialize reward config for existing worlds (migration)

# Quest reward pool
data modify storage mythcraft:config rewards.questPool set value ["golden_apple","ender_pearls","wind_charges","strength_powder","harming_potions","trident","buff_resistance","buff_speed","buff_health_boost","buff_strength"]

# City reward pools (matching original hardcoded city rewards)
data modify storage mythcraft:config cities.City1.rewardPool set value ["invis_kelp","wind_arrows"]
data modify storage mythcraft:config cities.City2.rewardPool set value []
data modify storage mythcraft:config cities.City3.rewardPool set value []
data modify storage mythcraft:config cities.City4.rewardPool set value ["levitation_arrows"]
data modify storage mythcraft:config cities.City5.rewardPool set value ["poison_potions"]
data modify storage mythcraft:config cities.City6.rewardPool set value ["nourishing_bread"]
data modify storage mythcraft:config cities.City7.rewardPool set value ["regen_tear"]
