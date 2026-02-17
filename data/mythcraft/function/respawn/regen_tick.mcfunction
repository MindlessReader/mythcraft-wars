# Increment one troop count per regen-active city (regular first, then boss)
# Runs every game.regenInterval seconds during active game
# Respawn pass handles spawning the actual entities

# City1
scoreboard players set _didRegen mathCounter 0
execute if score City1 regenActive matches 1 unless score City1 troopCount = City1 troopCap run scoreboard players set _didRegen mathCounter 1
execute if score _didRegen mathCounter matches 1 run scoreboard players add City1 troopCount 1
execute if score _didRegen mathCounter matches 1 if entity @a[tag=debugMode] run say [DEBUG] Regen tick: City1 regular +1
execute if score City1 regenActive matches 1 if score _didRegen mathCounter matches 0 unless score City1 bossCount = City1 bossCap run scoreboard players add City1 bossCount 1
execute if score City1 regenActive matches 1 if score _didRegen mathCounter matches 0 unless score City1 bossCount = City1 bossCap if entity @a[tag=debugMode] run say [DEBUG] Regen tick: City1 boss +1
execute if score City1 regenActive matches 1 if score City1 troopCount = City1 troopCap if score City1 bossCount = City1 bossCap if entity @a[tag=debugMode] run say [DEBUG] Regen tick: City1 fully regenerated
execute if score City1 regenActive matches 1 if score City1 troopCount = City1 troopCap if score City1 bossCount = City1 bossCap run scoreboard players set City1 regenActive 2

# City2
scoreboard players set _didRegen mathCounter 0
execute if score City2 regenActive matches 1 unless score City2 troopCount = City2 troopCap run scoreboard players set _didRegen mathCounter 1
execute if score _didRegen mathCounter matches 1 run scoreboard players add City2 troopCount 1
execute if score _didRegen mathCounter matches 1 if entity @a[tag=debugMode] run say [DEBUG] Regen tick: City2 regular +1
execute if score City2 regenActive matches 1 if score _didRegen mathCounter matches 0 unless score City2 bossCount = City2 bossCap run scoreboard players add City2 bossCount 1
execute if score City2 regenActive matches 1 if score _didRegen mathCounter matches 0 unless score City2 bossCount = City2 bossCap if entity @a[tag=debugMode] run say [DEBUG] Regen tick: City2 boss +1
execute if score City2 regenActive matches 1 if score City2 troopCount = City2 troopCap if score City2 bossCount = City2 bossCap if entity @a[tag=debugMode] run say [DEBUG] Regen tick: City2 fully regenerated
execute if score City2 regenActive matches 1 if score City2 troopCount = City2 troopCap if score City2 bossCount = City2 bossCap run scoreboard players set City2 regenActive 2

# City3
scoreboard players set _didRegen mathCounter 0
execute if score City3 regenActive matches 1 unless score City3 troopCount = City3 troopCap run scoreboard players set _didRegen mathCounter 1
execute if score _didRegen mathCounter matches 1 run scoreboard players add City3 troopCount 1
execute if score _didRegen mathCounter matches 1 if entity @a[tag=debugMode] run say [DEBUG] Regen tick: City3 regular +1
execute if score City3 regenActive matches 1 if score _didRegen mathCounter matches 0 unless score City3 bossCount = City3 bossCap run scoreboard players add City3 bossCount 1
execute if score City3 regenActive matches 1 if score _didRegen mathCounter matches 0 unless score City3 bossCount = City3 bossCap if entity @a[tag=debugMode] run say [DEBUG] Regen tick: City3 boss +1
execute if score City3 regenActive matches 1 if score City3 troopCount = City3 troopCap if score City3 bossCount = City3 bossCap if entity @a[tag=debugMode] run say [DEBUG] Regen tick: City3 fully regenerated
execute if score City3 regenActive matches 1 if score City3 troopCount = City3 troopCap if score City3 bossCount = City3 bossCap run scoreboard players set City3 regenActive 2

# City4
scoreboard players set _didRegen mathCounter 0
execute if score City4 regenActive matches 1 unless score City4 troopCount = City4 troopCap run scoreboard players set _didRegen mathCounter 1
execute if score _didRegen mathCounter matches 1 run scoreboard players add City4 troopCount 1
execute if score _didRegen mathCounter matches 1 if entity @a[tag=debugMode] run say [DEBUG] Regen tick: City4 regular +1
execute if score City4 regenActive matches 1 if score _didRegen mathCounter matches 0 unless score City4 bossCount = City4 bossCap run scoreboard players add City4 bossCount 1
execute if score City4 regenActive matches 1 if score _didRegen mathCounter matches 0 unless score City4 bossCount = City4 bossCap if entity @a[tag=debugMode] run say [DEBUG] Regen tick: City4 boss +1
execute if score City4 regenActive matches 1 if score City4 troopCount = City4 troopCap if score City4 bossCount = City4 bossCap if entity @a[tag=debugMode] run say [DEBUG] Regen tick: City4 fully regenerated
execute if score City4 regenActive matches 1 if score City4 troopCount = City4 troopCap if score City4 bossCount = City4 bossCap run scoreboard players set City4 regenActive 2

# City5
scoreboard players set _didRegen mathCounter 0
execute if score City5 regenActive matches 1 unless score City5 troopCount = City5 troopCap run scoreboard players set _didRegen mathCounter 1
execute if score _didRegen mathCounter matches 1 run scoreboard players add City5 troopCount 1
execute if score _didRegen mathCounter matches 1 if entity @a[tag=debugMode] run say [DEBUG] Regen tick: City5 regular +1
execute if score City5 regenActive matches 1 if score _didRegen mathCounter matches 0 unless score City5 bossCount = City5 bossCap run scoreboard players add City5 bossCount 1
execute if score City5 regenActive matches 1 if score _didRegen mathCounter matches 0 unless score City5 bossCount = City5 bossCap if entity @a[tag=debugMode] run say [DEBUG] Regen tick: City5 boss +1
execute if score City5 regenActive matches 1 if score City5 troopCount = City5 troopCap if score City5 bossCount = City5 bossCap if entity @a[tag=debugMode] run say [DEBUG] Regen tick: City5 fully regenerated
execute if score City5 regenActive matches 1 if score City5 troopCount = City5 troopCap if score City5 bossCount = City5 bossCap run scoreboard players set City5 regenActive 2

# City6
scoreboard players set _didRegen mathCounter 0
execute if score City6 regenActive matches 1 unless score City6 troopCount = City6 troopCap run scoreboard players set _didRegen mathCounter 1
execute if score _didRegen mathCounter matches 1 run scoreboard players add City6 troopCount 1
execute if score _didRegen mathCounter matches 1 if entity @a[tag=debugMode] run say [DEBUG] Regen tick: City6 regular +1
execute if score City6 regenActive matches 1 if score _didRegen mathCounter matches 0 unless score City6 bossCount = City6 bossCap run scoreboard players add City6 bossCount 1
execute if score City6 regenActive matches 1 if score _didRegen mathCounter matches 0 unless score City6 bossCount = City6 bossCap if entity @a[tag=debugMode] run say [DEBUG] Regen tick: City6 boss +1
execute if score City6 regenActive matches 1 if score City6 troopCount = City6 troopCap if score City6 bossCount = City6 bossCap if entity @a[tag=debugMode] run say [DEBUG] Regen tick: City6 fully regenerated
execute if score City6 regenActive matches 1 if score City6 troopCount = City6 troopCap if score City6 bossCount = City6 bossCap run scoreboard players set City6 regenActive 2

# City7
scoreboard players set _didRegen mathCounter 0
execute if score City7 regenActive matches 1 unless score City7 troopCount = City7 troopCap run scoreboard players set _didRegen mathCounter 1
execute if score _didRegen mathCounter matches 1 run scoreboard players add City7 troopCount 1
execute if score _didRegen mathCounter matches 1 if entity @a[tag=debugMode] run say [DEBUG] Regen tick: City7 regular +1
execute if score City7 regenActive matches 1 if score _didRegen mathCounter matches 0 unless score City7 bossCount = City7 bossCap run scoreboard players add City7 bossCount 1
execute if score City7 regenActive matches 1 if score _didRegen mathCounter matches 0 unless score City7 bossCount = City7 bossCap if entity @a[tag=debugMode] run say [DEBUG] Regen tick: City7 boss +1
execute if score City7 regenActive matches 1 if score City7 troopCount = City7 troopCap if score City7 bossCount = City7 bossCap if entity @a[tag=debugMode] run say [DEBUG] Regen tick: City7 fully regenerated
execute if score City7 regenActive matches 1 if score City7 troopCount = City7 troopCap if score City7 bossCount = City7 bossCap run scoreboard players set City7 regenActive 2

# Reschedule
data modify storage mythcraft:temp duration set from storage mythcraft:config game.regenInterval
function mythcraft:schedule/regen_tick with storage mythcraft:temp
