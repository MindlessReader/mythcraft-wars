# Attempt to spawn the raid boss at a random eligible location
# Called via schedule from check_spawn or schedule_pregame_spawn

# Abort if already spawned or game is over
execute unless score RaidBoss raidBossState matches 0 run return 0
execute if score QuestTracker endGame matches 2 run return 0

# Transition flag check: if within 15s of a quest start/end, delay by 15s
execute if data storage mythcraft:raidboss {recentTransition:1b} run schedule function mythcraft:raidboss/try_spawn 15s
execute if data storage mythcraft:raidboss {recentTransition:1b} if entity @a[tag=debugMode] run say [DEBUG] Raid Boss spawn delayed 15s (transition flag active)
execute if data storage mythcraft:raidboss {recentTransition:1b} run return 0

# Build eligible location list (config-only: has raidBossPool[0])
# Marker entities may not be loaded — spawning is deferred via spawn_loop if needed
data modify storage mythcraft:temp eligibleLocations set value []

# Cities
execute if data storage mythcraft:config cities.City1.raidBossPool[0] run data modify storage mythcraft:temp eligibleLocations append value {name:"City1",configPath:"cities.City1"}
execute if data storage mythcraft:config cities.City2.raidBossPool[0] run data modify storage mythcraft:temp eligibleLocations append value {name:"City2",configPath:"cities.City2"}
execute if data storage mythcraft:config cities.City3.raidBossPool[0] run data modify storage mythcraft:temp eligibleLocations append value {name:"City3",configPath:"cities.City3"}
execute if data storage mythcraft:config cities.City4.raidBossPool[0] run data modify storage mythcraft:temp eligibleLocations append value {name:"City4",configPath:"cities.City4"}
execute if data storage mythcraft:config cities.City5.raidBossPool[0] run data modify storage mythcraft:temp eligibleLocations append value {name:"City5",configPath:"cities.City5"}
execute if data storage mythcraft:config cities.City6.raidBossPool[0] run data modify storage mythcraft:temp eligibleLocations append value {name:"City6",configPath:"cities.City6"}
execute if data storage mythcraft:config cities.City7.raidBossPool[0] run data modify storage mythcraft:temp eligibleLocations append value {name:"City7",configPath:"cities.City7"}

# Skill locations
execute if data storage mythcraft:config skillLocations.Attack.raidBossPool[0] run data modify storage mythcraft:temp eligibleLocations append value {name:"Attack",configPath:"skillLocations.Attack"}
execute if data storage mythcraft:config skillLocations.Defense.raidBossPool[0] run data modify storage mythcraft:temp eligibleLocations append value {name:"Defense",configPath:"skillLocations.Defense"}
execute if data storage mythcraft:config skillLocations.Magic.raidBossPool[0] run data modify storage mythcraft:temp eligibleLocations append value {name:"Magic",configPath:"skillLocations.Magic"}
execute if data storage mythcraft:config skillLocations.Special.raidBossPool[0] run data modify storage mythcraft:temp eligibleLocations append value {name:"Special",configPath:"skillLocations.Special"}

# Count eligible locations
execute store result score _eligibleCount mathCounter run data get storage mythcraft:temp eligibleLocations

# If none eligible, abort (no valid spawn point)
execute if score _eligibleCount mathCounter matches 0 if entity @a[tag=debugMode] run say [DEBUG] Raid Boss spawn aborted (no eligible locations)
execute if score _eligibleCount mathCounter matches 0 run return 0

# Pick random location from eligible list
execute store result score _locIndex mathCounter run random value 0..99
scoreboard players operation _locIndex mathCounter %= _eligibleCount mathCounter

# Select the chosen location's data
execute if score _locIndex mathCounter matches 0 run data modify storage mythcraft:temp chosen set from storage mythcraft:temp eligibleLocations[0]
execute if score _locIndex mathCounter matches 1 run data modify storage mythcraft:temp chosen set from storage mythcraft:temp eligibleLocations[1]
execute if score _locIndex mathCounter matches 2 run data modify storage mythcraft:temp chosen set from storage mythcraft:temp eligibleLocations[2]
execute if score _locIndex mathCounter matches 3 run data modify storage mythcraft:temp chosen set from storage mythcraft:temp eligibleLocations[3]
execute if score _locIndex mathCounter matches 4 run data modify storage mythcraft:temp chosen set from storage mythcraft:temp eligibleLocations[4]
execute if score _locIndex mathCounter matches 5 run data modify storage mythcraft:temp chosen set from storage mythcraft:temp eligibleLocations[5]
execute if score _locIndex mathCounter matches 6 run data modify storage mythcraft:temp chosen set from storage mythcraft:temp eligibleLocations[6]
execute if score _locIndex mathCounter matches 7 run data modify storage mythcraft:temp chosen set from storage mythcraft:temp eligibleLocations[7]
execute if score _locIndex mathCounter matches 8 run data modify storage mythcraft:temp chosen set from storage mythcraft:temp eligibleLocations[8]
execute if score _locIndex mathCounter matches 9 run data modify storage mythcraft:temp chosen set from storage mythcraft:temp eligibleLocations[9]
execute if score _locIndex mathCounter matches 10 run data modify storage mythcraft:temp chosen set from storage mythcraft:temp eligibleLocations[10]

# Store location name for runtime
data modify storage mythcraft:raidboss cityName set from storage mythcraft:temp chosen.name

# Debug: log chosen location
execute store result storage mythcraft:temp eligibleCount int 1 run scoreboard players get _eligibleCount mathCounter
data modify storage mythcraft:temp locationName set from storage mythcraft:raidboss cityName
execute if entity @a[tag=debugMode] run function mythcraft:debug/raidboss_location with storage mythcraft:temp

# Dispatch to spawn_at_location with the location name
function mythcraft:raidboss/spawn_at_location with storage mythcraft:temp chosen
