# Timer-based buffs (from quest rewards)
effect give @a[scores={BuffResistance=1..}] resistance 10 0
effect give @a[scores={BuffSpeed=1..}] speed 10 0
effect give @a[scores={BuffHealthBoost=1..}] health_boost 10 1
effect give @a[scores={BuffStrength=1..}] strength 10 0

# City ownership buffs (permanent while team owns a city with the buff in its reward pool)
execute if score Team1 CityBuffResistance matches 1.. run effect give @a[team=Team1] resistance 10 0
execute if score Team2 CityBuffResistance matches 1.. run effect give @a[team=Team2] resistance 10 0
execute if score Team1 CityBuffSpeed matches 1.. run effect give @a[team=Team1] speed 10 0
execute if score Team2 CityBuffSpeed matches 1.. run effect give @a[team=Team2] speed 10 0
execute if score Team1 CityBuffHealthBoost matches 1.. run effect give @a[team=Team1] health_boost 10 1
execute if score Team2 CityBuffHealthBoost matches 1.. run effect give @a[team=Team2] health_boost 10 1
execute if score Team1 CityBuffStrength matches 1.. run effect give @a[team=Team1] strength 10 0
execute if score Team2 CityBuffStrength matches 1.. run effect give @a[team=Team2] strength 10 0
