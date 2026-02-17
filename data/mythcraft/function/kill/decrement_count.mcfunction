# Decrement the appropriate troop count based on troopCategory in mythcraft:temp
# Params: $(cityName)
$execute if data storage mythcraft:temp {troopCategory:"regular"} run scoreboard players remove $(cityName) troopCount 1
$execute if data storage mythcraft:temp {troopCategory:"regular"} if entity @a[tag=debugMode] run say [DEBUG] Kill $(cityName): regular troopCount decremented
$execute if data storage mythcraft:temp {troopCategory:"boss"} run scoreboard players remove $(cityName) bossCount 1
$execute if data storage mythcraft:temp {troopCategory:"boss"} if entity @a[tag=debugMode] run say [DEBUG] Kill $(cityName): boss bossCount decremented
# Kill immediately stops active regen (quiet period must restart)
$scoreboard players set $(cityName) regenActive 0
