# Initialize troop counts from config caps for all cities and skill locations
# Called at game start — sets all counts to full caps
execute if entity @a[tag=debugMode] run say [DEBUG] Init counts: loading troop caps from config

# City1
execute store result score City1 troopCap run data get storage mythcraft:config cities.City1.troopCap
execute store result score City1 bossCap run data get storage mythcraft:config cities.City1.bossCap
scoreboard players operation City1 troopCount = City1 troopCap
scoreboard players operation City1 bossCount = City1 bossCap
scoreboard players operation City1 troopCountLastChecked = City1 troopCap
scoreboard players operation City1 bossCountLastChecked = City1 bossCap
scoreboard players set City1 regenActive 0

# City2
execute store result score City2 troopCap run data get storage mythcraft:config cities.City2.troopCap
execute store result score City2 bossCap run data get storage mythcraft:config cities.City2.bossCap
scoreboard players operation City2 troopCount = City2 troopCap
scoreboard players operation City2 bossCount = City2 bossCap
scoreboard players operation City2 troopCountLastChecked = City2 troopCap
scoreboard players operation City2 bossCountLastChecked = City2 bossCap
scoreboard players set City2 regenActive 0

# City3
execute store result score City3 troopCap run data get storage mythcraft:config cities.City3.troopCap
execute store result score City3 bossCap run data get storage mythcraft:config cities.City3.bossCap
scoreboard players operation City3 troopCount = City3 troopCap
scoreboard players operation City3 bossCount = City3 bossCap
scoreboard players operation City3 troopCountLastChecked = City3 troopCap
scoreboard players operation City3 bossCountLastChecked = City3 bossCap
scoreboard players set City3 regenActive 0

# City4
execute store result score City4 troopCap run data get storage mythcraft:config cities.City4.troopCap
execute store result score City4 bossCap run data get storage mythcraft:config cities.City4.bossCap
scoreboard players operation City4 troopCount = City4 troopCap
scoreboard players operation City4 bossCount = City4 bossCap
scoreboard players operation City4 troopCountLastChecked = City4 troopCap
scoreboard players operation City4 bossCountLastChecked = City4 bossCap
scoreboard players set City4 regenActive 0

# City5
execute store result score City5 troopCap run data get storage mythcraft:config cities.City5.troopCap
execute store result score City5 bossCap run data get storage mythcraft:config cities.City5.bossCap
scoreboard players operation City5 troopCount = City5 troopCap
scoreboard players operation City5 bossCount = City5 bossCap
scoreboard players operation City5 troopCountLastChecked = City5 troopCap
scoreboard players operation City5 bossCountLastChecked = City5 bossCap
scoreboard players set City5 regenActive 0

# City6
execute store result score City6 troopCap run data get storage mythcraft:config cities.City6.troopCap
execute store result score City6 bossCap run data get storage mythcraft:config cities.City6.bossCap
scoreboard players operation City6 troopCount = City6 troopCap
scoreboard players operation City6 bossCount = City6 bossCap
scoreboard players operation City6 troopCountLastChecked = City6 troopCap
scoreboard players operation City6 bossCountLastChecked = City6 bossCap
scoreboard players set City6 regenActive 0

# City7
execute store result score City7 troopCap run data get storage mythcraft:config cities.City7.troopCap
execute store result score City7 bossCap run data get storage mythcraft:config cities.City7.bossCap
scoreboard players operation City7 troopCount = City7 troopCap
scoreboard players operation City7 bossCount = City7 bossCap
scoreboard players operation City7 troopCountLastChecked = City7 troopCap
scoreboard players operation City7 bossCountLastChecked = City7 bossCap
scoreboard players set City7 regenActive 0

# Skill locations
execute store result score Attack troopCap run data get storage mythcraft:config skillLocations.Attack.troopCap
execute store result score Attack bossCap run data get storage mythcraft:config skillLocations.Attack.bossCap
scoreboard players operation Attack troopCount = Attack troopCap
scoreboard players operation Attack bossCount = Attack bossCap
scoreboard players set Attack regenActive 0

execute store result score Defense troopCap run data get storage mythcraft:config skillLocations.Defense.troopCap
execute store result score Defense bossCap run data get storage mythcraft:config skillLocations.Defense.bossCap
scoreboard players operation Defense troopCount = Defense troopCap
scoreboard players operation Defense bossCount = Defense bossCap
scoreboard players set Defense regenActive 0

execute store result score Magic troopCap run data get storage mythcraft:config skillLocations.Magic.troopCap
execute store result score Magic bossCap run data get storage mythcraft:config skillLocations.Magic.bossCap
scoreboard players operation Magic troopCount = Magic troopCap
scoreboard players operation Magic bossCount = Magic bossCap
scoreboard players set Magic regenActive 0

execute store result score Special troopCap run data get storage mythcraft:config skillLocations.Special.troopCap
execute store result score Special bossCap run data get storage mythcraft:config skillLocations.Special.bossCap
scoreboard players operation Special troopCount = Special troopCap
scoreboard players operation Special bossCount = Special bossCap
scoreboard players set Special regenActive 0

execute if entity @a[tag=debugMode] run say [DEBUG] Init counts: all 7 cities + 4 skill locations initialized
