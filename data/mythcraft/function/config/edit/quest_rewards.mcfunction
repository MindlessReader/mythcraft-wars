# Reads which rewards are in the quest pool and opens the quest rewards editor

# Default all to false (stored as strings so macro substitution produces bare true/false for dialog initial:)
data modify storage mythcraft:temp hasGoldenApple set value "false"
data modify storage mythcraft:temp hasEnderPearls set value "false"
data modify storage mythcraft:temp hasWindCharges set value "false"
data modify storage mythcraft:temp hasStrengthPowder set value "false"
data modify storage mythcraft:temp hasHarmingPotions set value "false"
data modify storage mythcraft:temp hasTrident set value "false"
data modify storage mythcraft:temp hasInvisKelp set value "false"
data modify storage mythcraft:temp hasWindArrows set value "false"
data modify storage mythcraft:temp hasLevitationArrows set value "false"
data modify storage mythcraft:temp hasPoisonPotions set value "false"
data modify storage mythcraft:temp hasRegenTear set value "false"
data modify storage mythcraft:temp hasBuffResistance set value "false"
data modify storage mythcraft:temp hasBuffSpeed set value "false"
data modify storage mythcraft:temp hasBuffHealthBoost set value "false"
data modify storage mythcraft:temp hasBuffStrength set value "false"

# Check quest pool (array-contains matching)
execute if data storage mythcraft:config {rewards:{questPool:["golden_apple"]}} run data modify storage mythcraft:temp hasGoldenApple set value "true"
execute if data storage mythcraft:config {rewards:{questPool:["ender_pearls"]}} run data modify storage mythcraft:temp hasEnderPearls set value "true"
execute if data storage mythcraft:config {rewards:{questPool:["wind_charges"]}} run data modify storage mythcraft:temp hasWindCharges set value "true"
execute if data storage mythcraft:config {rewards:{questPool:["strength_powder"]}} run data modify storage mythcraft:temp hasStrengthPowder set value "true"
execute if data storage mythcraft:config {rewards:{questPool:["harming_potions"]}} run data modify storage mythcraft:temp hasHarmingPotions set value "true"
execute if data storage mythcraft:config {rewards:{questPool:["trident"]}} run data modify storage mythcraft:temp hasTrident set value "true"
execute if data storage mythcraft:config {rewards:{questPool:["invis_kelp"]}} run data modify storage mythcraft:temp hasInvisKelp set value "true"
execute if data storage mythcraft:config {rewards:{questPool:["wind_arrows"]}} run data modify storage mythcraft:temp hasWindArrows set value "true"
execute if data storage mythcraft:config {rewards:{questPool:["levitation_arrows"]}} run data modify storage mythcraft:temp hasLevitationArrows set value "true"
execute if data storage mythcraft:config {rewards:{questPool:["poison_potions"]}} run data modify storage mythcraft:temp hasPoisonPotions set value "true"
execute if data storage mythcraft:config {rewards:{questPool:["regen_tear"]}} run data modify storage mythcraft:temp hasRegenTear set value "true"
execute if data storage mythcraft:config {rewards:{questPool:["buff_resistance"]}} run data modify storage mythcraft:temp hasBuffResistance set value "true"
execute if data storage mythcraft:config {rewards:{questPool:["buff_speed"]}} run data modify storage mythcraft:temp hasBuffSpeed set value "true"
execute if data storage mythcraft:config {rewards:{questPool:["buff_health_boost"]}} run data modify storage mythcraft:temp hasBuffHealthBoost set value "true"
execute if data storage mythcraft:config {rewards:{questPool:["buff_strength"]}} run data modify storage mythcraft:temp hasBuffStrength set value "true"

function mythcraft:config/show/quest_rewards with storage mythcraft:temp
