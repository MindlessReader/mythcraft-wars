# Show troop count for a specific city on the player's XP bar
# Macro function — called with {cityName:"CityX"}

# Mark that we found a city (don't clear XP bar)
tag @s remove _clearTroopBar

# Calculate total troops alive in this city (regular + boss)
scoreboard players set @s _troopTotal 0
$scoreboard players operation @s _troopTotal = $(cityName) troopCount
$scoreboard players operation @s _troopTotal += $(cityName) bossCount

# Calculate total troop cap for this city
scoreboard players set @s _troopCap 0
$scoreboard players operation @s _troopCap = $(cityName) troopCap
$scoreboard players operation @s _troopCap += $(cityName) bossCap

# Calculate XP bar fill points: (2 * total + 6) * total / cap
# Uses threshold-1 (2L+6 instead of 2L+7) to avoid exceeding max points and causing silent failure
# Accurate for levels 0-16 (typical troop counts), close enough for higher
scoreboard players set @s _xpFill 2
scoreboard players operation @s _xpFill *= @s _troopTotal
scoreboard players add @s _xpFill 6
scoreboard players operation @s _xpFill *= @s _troopTotal
execute if score @s _troopCap matches 1.. run scoreboard players operation @s _xpFill /= @s _troopCap
execute if score @s _troopCap matches 0 run scoreboard players set @s _xpFill 0

# Ensure at least 1 point of bar fill when troops exist (prevents empty bar at low fractions)
execute if score @s _troopTotal matches 1.. if score @s _xpFill matches 0 run scoreboard players set @s _xpFill 1

# Store values for macro-based XP commands
execute store result storage mythcraft:temp troopTotal int 1 run scoreboard players get @s _troopTotal
execute store result storage mythcraft:temp troopFill int 1 run scoreboard players get @s _xpFill

# Apply XP level (troop count) and bar fill
function mythcraft:troop_indicator/set_xp with storage mythcraft:temp
