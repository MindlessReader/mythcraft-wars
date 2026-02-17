# Initialize raid boss config for existing worlds (migration)

# Raid boss pools per city (which boss types can spawn; empty = disabled)
data modify storage mythcraft:config cities.City1.raidBossPool set value ["giant_slime"]
data modify storage mythcraft:config cities.City2.raidBossPool set value ["giant_slime"]
data modify storage mythcraft:config cities.City3.raidBossPool set value []
data modify storage mythcraft:config cities.City4.raidBossPool set value []
data modify storage mythcraft:config cities.City5.raidBossPool set value []
data modify storage mythcraft:config cities.City6.raidBossPool set value ["giant_slime"]
data modify storage mythcraft:config cities.City7.raidBossPool set value []

# Raid boss pools per skill location
data modify storage mythcraft:config skillLocations.Attack.raidBossPool set value []
data modify storage mythcraft:config skillLocations.Defense.raidBossPool set value []
data modify storage mythcraft:config skillLocations.Magic.raidBossPool set value []
data modify storage mythcraft:config skillLocations.Special.raidBossPool set value []

# Raid boss reward pool (ALL enabled rewards granted to killing team)
data modify storage mythcraft:config rewards.raidBossPool set value ["victory_point","golden_apple","ender_pearls","buff_speed"]
