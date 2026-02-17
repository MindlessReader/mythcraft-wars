# Troop indicator: show nearby city troop count on XP bar
# Called as each player at their position from tick

# Default: plan to clear XP bar (removed if a city is found)
tag @s add _clearTroopBar

# Find nearest city spawnmarker within 100 blocks (exclude skill location markers)
tag @e[type=marker,tag=spawnmarker,tag=!Attack,tag=!Defense,tag=!Magic,tag=!Special,distance=..100,limit=1,sort=nearest] add _nearestCity

# Check which city the nearest marker belongs to and show troop count
execute if entity @e[tag=_nearestCity,tag=City1] run function mythcraft:troop_indicator/show {cityName:"City1"}
execute if entity @e[tag=_nearestCity,tag=City2] run function mythcraft:troop_indicator/show {cityName:"City2"}
execute if entity @e[tag=_nearestCity,tag=City3] run function mythcraft:troop_indicator/show {cityName:"City3"}
execute if entity @e[tag=_nearestCity,tag=City4] run function mythcraft:troop_indicator/show {cityName:"City4"}
execute if entity @e[tag=_nearestCity,tag=City5] run function mythcraft:troop_indicator/show {cityName:"City5"}
execute if entity @e[tag=_nearestCity,tag=City6] run function mythcraft:troop_indicator/show {cityName:"City6"}
execute if entity @e[tag=_nearestCity,tag=City7] run function mythcraft:troop_indicator/show {cityName:"City7"}

# Clean up marker tag
tag @e[tag=_nearestCity] remove _nearestCity

# Clear XP bar if no city marker was found nearby
execute if entity @s[tag=_clearTroopBar] run xp set @s 0 levels
execute if entity @s[tag=_clearTroopBar] run xp set @s 0 points
tag @s remove _clearTroopBar
