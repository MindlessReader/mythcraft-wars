# Check each city for quiet period — activate regen if counts unchanged since last check
# Runs every game.regenCheckInterval seconds during active game
# Deactivation happens immediately on kill (in kill/decrement_count)

# City1 — activate if inactive, unchanged, and below cap (either regular or boss)
execute if score City1 regenActive matches 0 if score City1 troopCount = City1 troopCountLastChecked if score City1 bossCount = City1 bossCountLastChecked unless score City1 troopCount = City1 troopCap run scoreboard players set City1 regenActive 1
execute if score City1 regenActive matches 0 if score City1 troopCount = City1 troopCountLastChecked if score City1 bossCount = City1 bossCountLastChecked if score City1 troopCount = City1 troopCap unless score City1 bossCount = City1 bossCap run scoreboard players set City1 regenActive 1
execute if score City1 regenActive matches 1 if entity @a[tag=debugMode] run say [DEBUG] Regen check: City1 regen active
execute if score City1 regenActive matches 0 run scoreboard players operation City1 troopCountLastChecked = City1 troopCount
execute if score City1 regenActive matches 0 run scoreboard players operation City1 bossCountLastChecked = City1 bossCount

# City2
execute if score City2 regenActive matches 0 if score City2 troopCount = City2 troopCountLastChecked if score City2 bossCount = City2 bossCountLastChecked unless score City2 troopCount = City2 troopCap run scoreboard players set City2 regenActive 1
execute if score City2 regenActive matches 0 if score City2 troopCount = City2 troopCountLastChecked if score City2 bossCount = City2 bossCountLastChecked if score City2 troopCount = City2 troopCap unless score City2 bossCount = City2 bossCap run scoreboard players set City2 regenActive 1
execute if score City2 regenActive matches 1 if entity @a[tag=debugMode] run say [DEBUG] Regen check: City2 regen active
execute if score City2 regenActive matches 0 run scoreboard players operation City2 troopCountLastChecked = City2 troopCount
execute if score City2 regenActive matches 0 run scoreboard players operation City2 bossCountLastChecked = City2 bossCount

# City3
execute if score City3 regenActive matches 0 if score City3 troopCount = City3 troopCountLastChecked if score City3 bossCount = City3 bossCountLastChecked unless score City3 troopCount = City3 troopCap run scoreboard players set City3 regenActive 1
execute if score City3 regenActive matches 0 if score City3 troopCount = City3 troopCountLastChecked if score City3 bossCount = City3 bossCountLastChecked if score City3 troopCount = City3 troopCap unless score City3 bossCount = City3 bossCap run scoreboard players set City3 regenActive 1
execute if score City3 regenActive matches 1 if entity @a[tag=debugMode] run say [DEBUG] Regen check: City3 regen active
execute if score City3 regenActive matches 0 run scoreboard players operation City3 troopCountLastChecked = City3 troopCount
execute if score City3 regenActive matches 0 run scoreboard players operation City3 bossCountLastChecked = City3 bossCount

# City4
execute if score City4 regenActive matches 0 if score City4 troopCount = City4 troopCountLastChecked if score City4 bossCount = City4 bossCountLastChecked unless score City4 troopCount = City4 troopCap run scoreboard players set City4 regenActive 1
execute if score City4 regenActive matches 0 if score City4 troopCount = City4 troopCountLastChecked if score City4 bossCount = City4 bossCountLastChecked if score City4 troopCount = City4 troopCap unless score City4 bossCount = City4 bossCap run scoreboard players set City4 regenActive 1
execute if score City4 regenActive matches 1 if entity @a[tag=debugMode] run say [DEBUG] Regen check: City4 regen active
execute if score City4 regenActive matches 0 run scoreboard players operation City4 troopCountLastChecked = City4 troopCount
execute if score City4 regenActive matches 0 run scoreboard players operation City4 bossCountLastChecked = City4 bossCount

# City5
execute if score City5 regenActive matches 0 if score City5 troopCount = City5 troopCountLastChecked if score City5 bossCount = City5 bossCountLastChecked unless score City5 troopCount = City5 troopCap run scoreboard players set City5 regenActive 1
execute if score City5 regenActive matches 0 if score City5 troopCount = City5 troopCountLastChecked if score City5 bossCount = City5 bossCountLastChecked if score City5 troopCount = City5 troopCap unless score City5 bossCount = City5 bossCap run scoreboard players set City5 regenActive 1
execute if score City5 regenActive matches 1 if entity @a[tag=debugMode] run say [DEBUG] Regen check: City5 regen active
execute if score City5 regenActive matches 0 run scoreboard players operation City5 troopCountLastChecked = City5 troopCount
execute if score City5 regenActive matches 0 run scoreboard players operation City5 bossCountLastChecked = City5 bossCount

# City6
execute if score City6 regenActive matches 0 if score City6 troopCount = City6 troopCountLastChecked if score City6 bossCount = City6 bossCountLastChecked unless score City6 troopCount = City6 troopCap run scoreboard players set City6 regenActive 1
execute if score City6 regenActive matches 0 if score City6 troopCount = City6 troopCountLastChecked if score City6 bossCount = City6 bossCountLastChecked if score City6 troopCount = City6 troopCap unless score City6 bossCount = City6 bossCap run scoreboard players set City6 regenActive 1
execute if score City6 regenActive matches 1 if entity @a[tag=debugMode] run say [DEBUG] Regen check: City6 regen active
execute if score City6 regenActive matches 0 run scoreboard players operation City6 troopCountLastChecked = City6 troopCount
execute if score City6 regenActive matches 0 run scoreboard players operation City6 bossCountLastChecked = City6 bossCount

# City7
execute if score City7 regenActive matches 0 if score City7 troopCount = City7 troopCountLastChecked if score City7 bossCount = City7 bossCountLastChecked unless score City7 troopCount = City7 troopCap run scoreboard players set City7 regenActive 1
execute if score City7 regenActive matches 0 if score City7 troopCount = City7 troopCountLastChecked if score City7 bossCount = City7 bossCountLastChecked if score City7 troopCount = City7 troopCap unless score City7 bossCount = City7 bossCap run scoreboard players set City7 regenActive 1
execute if score City7 regenActive matches 1 if entity @a[tag=debugMode] run say [DEBUG] Regen check: City7 regen active
execute if score City7 regenActive matches 0 run scoreboard players operation City7 troopCountLastChecked = City7 troopCount
execute if score City7 regenActive matches 0 run scoreboard players operation City7 bossCountLastChecked = City7 bossCount

# Reschedule
data modify storage mythcraft:temp duration set from storage mythcraft:config game.regenCheckInterval
function mythcraft:schedule/regen_check with storage mythcraft:temp
