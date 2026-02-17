# Recompute permanent city buff ownership flags
# Called on: conquest, city rewards config save, game start
# Sets CityBuff* scoreboards to 1 if any owned city has that buff in its reward pool

# Reset all flags
scoreboard players set Team1 CityBuffResistance 0
scoreboard players set Team2 CityBuffResistance 0
scoreboard players set Team1 CityBuffSpeed 0
scoreboard players set Team2 CityBuffSpeed 0
scoreboard players set Team1 CityBuffHealthBoost 0
scoreboard players set Team2 CityBuffHealthBoost 0
scoreboard players set Team1 CityBuffStrength 0
scoreboard players set Team2 CityBuffStrength 0

# City1
execute if score City1 cityOwnership matches 1 if data storage mythcraft:config {cities:{City1:{rewardPool:["buff_resistance"]}}} run scoreboard players set Team1 CityBuffResistance 1
execute if score City1 cityOwnership matches 2 if data storage mythcraft:config {cities:{City1:{rewardPool:["buff_resistance"]}}} run scoreboard players set Team2 CityBuffResistance 1
execute if score City1 cityOwnership matches 1 if data storage mythcraft:config {cities:{City1:{rewardPool:["buff_speed"]}}} run scoreboard players set Team1 CityBuffSpeed 1
execute if score City1 cityOwnership matches 2 if data storage mythcraft:config {cities:{City1:{rewardPool:["buff_speed"]}}} run scoreboard players set Team2 CityBuffSpeed 1
execute if score City1 cityOwnership matches 1 if data storage mythcraft:config {cities:{City1:{rewardPool:["buff_health_boost"]}}} run scoreboard players set Team1 CityBuffHealthBoost 1
execute if score City1 cityOwnership matches 2 if data storage mythcraft:config {cities:{City1:{rewardPool:["buff_health_boost"]}}} run scoreboard players set Team2 CityBuffHealthBoost 1
execute if score City1 cityOwnership matches 1 if data storage mythcraft:config {cities:{City1:{rewardPool:["buff_strength"]}}} run scoreboard players set Team1 CityBuffStrength 1
execute if score City1 cityOwnership matches 2 if data storage mythcraft:config {cities:{City1:{rewardPool:["buff_strength"]}}} run scoreboard players set Team2 CityBuffStrength 1

# City2
execute if score City2 cityOwnership matches 1 if data storage mythcraft:config {cities:{City2:{rewardPool:["buff_resistance"]}}} run scoreboard players set Team1 CityBuffResistance 1
execute if score City2 cityOwnership matches 2 if data storage mythcraft:config {cities:{City2:{rewardPool:["buff_resistance"]}}} run scoreboard players set Team2 CityBuffResistance 1
execute if score City2 cityOwnership matches 1 if data storage mythcraft:config {cities:{City2:{rewardPool:["buff_speed"]}}} run scoreboard players set Team1 CityBuffSpeed 1
execute if score City2 cityOwnership matches 2 if data storage mythcraft:config {cities:{City2:{rewardPool:["buff_speed"]}}} run scoreboard players set Team2 CityBuffSpeed 1
execute if score City2 cityOwnership matches 1 if data storage mythcraft:config {cities:{City2:{rewardPool:["buff_health_boost"]}}} run scoreboard players set Team1 CityBuffHealthBoost 1
execute if score City2 cityOwnership matches 2 if data storage mythcraft:config {cities:{City2:{rewardPool:["buff_health_boost"]}}} run scoreboard players set Team2 CityBuffHealthBoost 1
execute if score City2 cityOwnership matches 1 if data storage mythcraft:config {cities:{City2:{rewardPool:["buff_strength"]}}} run scoreboard players set Team1 CityBuffStrength 1
execute if score City2 cityOwnership matches 2 if data storage mythcraft:config {cities:{City2:{rewardPool:["buff_strength"]}}} run scoreboard players set Team2 CityBuffStrength 1

# City3
execute if score City3 cityOwnership matches 1 if data storage mythcraft:config {cities:{City3:{rewardPool:["buff_resistance"]}}} run scoreboard players set Team1 CityBuffResistance 1
execute if score City3 cityOwnership matches 2 if data storage mythcraft:config {cities:{City3:{rewardPool:["buff_resistance"]}}} run scoreboard players set Team2 CityBuffResistance 1
execute if score City3 cityOwnership matches 1 if data storage mythcraft:config {cities:{City3:{rewardPool:["buff_speed"]}}} run scoreboard players set Team1 CityBuffSpeed 1
execute if score City3 cityOwnership matches 2 if data storage mythcraft:config {cities:{City3:{rewardPool:["buff_speed"]}}} run scoreboard players set Team2 CityBuffSpeed 1
execute if score City3 cityOwnership matches 1 if data storage mythcraft:config {cities:{City3:{rewardPool:["buff_health_boost"]}}} run scoreboard players set Team1 CityBuffHealthBoost 1
execute if score City3 cityOwnership matches 2 if data storage mythcraft:config {cities:{City3:{rewardPool:["buff_health_boost"]}}} run scoreboard players set Team2 CityBuffHealthBoost 1
execute if score City3 cityOwnership matches 1 if data storage mythcraft:config {cities:{City3:{rewardPool:["buff_strength"]}}} run scoreboard players set Team1 CityBuffStrength 1
execute if score City3 cityOwnership matches 2 if data storage mythcraft:config {cities:{City3:{rewardPool:["buff_strength"]}}} run scoreboard players set Team2 CityBuffStrength 1

# City4
execute if score City4 cityOwnership matches 1 if data storage mythcraft:config {cities:{City4:{rewardPool:["buff_resistance"]}}} run scoreboard players set Team1 CityBuffResistance 1
execute if score City4 cityOwnership matches 2 if data storage mythcraft:config {cities:{City4:{rewardPool:["buff_resistance"]}}} run scoreboard players set Team2 CityBuffResistance 1
execute if score City4 cityOwnership matches 1 if data storage mythcraft:config {cities:{City4:{rewardPool:["buff_speed"]}}} run scoreboard players set Team1 CityBuffSpeed 1
execute if score City4 cityOwnership matches 2 if data storage mythcraft:config {cities:{City4:{rewardPool:["buff_speed"]}}} run scoreboard players set Team2 CityBuffSpeed 1
execute if score City4 cityOwnership matches 1 if data storage mythcraft:config {cities:{City4:{rewardPool:["buff_health_boost"]}}} run scoreboard players set Team1 CityBuffHealthBoost 1
execute if score City4 cityOwnership matches 2 if data storage mythcraft:config {cities:{City4:{rewardPool:["buff_health_boost"]}}} run scoreboard players set Team2 CityBuffHealthBoost 1
execute if score City4 cityOwnership matches 1 if data storage mythcraft:config {cities:{City4:{rewardPool:["buff_strength"]}}} run scoreboard players set Team1 CityBuffStrength 1
execute if score City4 cityOwnership matches 2 if data storage mythcraft:config {cities:{City4:{rewardPool:["buff_strength"]}}} run scoreboard players set Team2 CityBuffStrength 1

# City5
execute if score City5 cityOwnership matches 1 if data storage mythcraft:config {cities:{City5:{rewardPool:["buff_resistance"]}}} run scoreboard players set Team1 CityBuffResistance 1
execute if score City5 cityOwnership matches 2 if data storage mythcraft:config {cities:{City5:{rewardPool:["buff_resistance"]}}} run scoreboard players set Team2 CityBuffResistance 1
execute if score City5 cityOwnership matches 1 if data storage mythcraft:config {cities:{City5:{rewardPool:["buff_speed"]}}} run scoreboard players set Team1 CityBuffSpeed 1
execute if score City5 cityOwnership matches 2 if data storage mythcraft:config {cities:{City5:{rewardPool:["buff_speed"]}}} run scoreboard players set Team2 CityBuffSpeed 1
execute if score City5 cityOwnership matches 1 if data storage mythcraft:config {cities:{City5:{rewardPool:["buff_health_boost"]}}} run scoreboard players set Team1 CityBuffHealthBoost 1
execute if score City5 cityOwnership matches 2 if data storage mythcraft:config {cities:{City5:{rewardPool:["buff_health_boost"]}}} run scoreboard players set Team2 CityBuffHealthBoost 1
execute if score City5 cityOwnership matches 1 if data storage mythcraft:config {cities:{City5:{rewardPool:["buff_strength"]}}} run scoreboard players set Team1 CityBuffStrength 1
execute if score City5 cityOwnership matches 2 if data storage mythcraft:config {cities:{City5:{rewardPool:["buff_strength"]}}} run scoreboard players set Team2 CityBuffStrength 1

# City6
execute if score City6 cityOwnership matches 1 if data storage mythcraft:config {cities:{City6:{rewardPool:["buff_resistance"]}}} run scoreboard players set Team1 CityBuffResistance 1
execute if score City6 cityOwnership matches 2 if data storage mythcraft:config {cities:{City6:{rewardPool:["buff_resistance"]}}} run scoreboard players set Team2 CityBuffResistance 1
execute if score City6 cityOwnership matches 1 if data storage mythcraft:config {cities:{City6:{rewardPool:["buff_speed"]}}} run scoreboard players set Team1 CityBuffSpeed 1
execute if score City6 cityOwnership matches 2 if data storage mythcraft:config {cities:{City6:{rewardPool:["buff_speed"]}}} run scoreboard players set Team2 CityBuffSpeed 1
execute if score City6 cityOwnership matches 1 if data storage mythcraft:config {cities:{City6:{rewardPool:["buff_health_boost"]}}} run scoreboard players set Team1 CityBuffHealthBoost 1
execute if score City6 cityOwnership matches 2 if data storage mythcraft:config {cities:{City6:{rewardPool:["buff_health_boost"]}}} run scoreboard players set Team2 CityBuffHealthBoost 1
execute if score City6 cityOwnership matches 1 if data storage mythcraft:config {cities:{City6:{rewardPool:["buff_strength"]}}} run scoreboard players set Team1 CityBuffStrength 1
execute if score City6 cityOwnership matches 2 if data storage mythcraft:config {cities:{City6:{rewardPool:["buff_strength"]}}} run scoreboard players set Team2 CityBuffStrength 1

# City7
execute if score City7 cityOwnership matches 1 if data storage mythcraft:config {cities:{City7:{rewardPool:["buff_resistance"]}}} run scoreboard players set Team1 CityBuffResistance 1
execute if score City7 cityOwnership matches 2 if data storage mythcraft:config {cities:{City7:{rewardPool:["buff_resistance"]}}} run scoreboard players set Team2 CityBuffResistance 1
execute if score City7 cityOwnership matches 1 if data storage mythcraft:config {cities:{City7:{rewardPool:["buff_speed"]}}} run scoreboard players set Team1 CityBuffSpeed 1
execute if score City7 cityOwnership matches 2 if data storage mythcraft:config {cities:{City7:{rewardPool:["buff_speed"]}}} run scoreboard players set Team2 CityBuffSpeed 1
execute if score City7 cityOwnership matches 1 if data storage mythcraft:config {cities:{City7:{rewardPool:["buff_health_boost"]}}} run scoreboard players set Team1 CityBuffHealthBoost 1
execute if score City7 cityOwnership matches 2 if data storage mythcraft:config {cities:{City7:{rewardPool:["buff_health_boost"]}}} run scoreboard players set Team2 CityBuffHealthBoost 1
execute if score City7 cityOwnership matches 1 if data storage mythcraft:config {cities:{City7:{rewardPool:["buff_strength"]}}} run scoreboard players set Team1 CityBuffStrength 1
execute if score City7 cityOwnership matches 2 if data storage mythcraft:config {cities:{City7:{rewardPool:["buff_strength"]}}} run scoreboard players set Team2 CityBuffStrength 1
