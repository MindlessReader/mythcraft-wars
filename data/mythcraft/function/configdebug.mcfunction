# Debug config snapshot — current world settings
# Run this to restore config to these saved values

# City display names
data modify storage mythcraft:config cities.City1.name set value "Celak"
data modify storage mythcraft:config cities.City2.name set value "Kings-Port"
data modify storage mythcraft:config cities.City3.name set value "Athens"
data modify storage mythcraft:config cities.City4.name set value "Delphi"
data modify storage mythcraft:config cities.City5.name set value "Loserville"
data modify storage mythcraft:config cities.City6.name set value "Amnis"
data modify storage mythcraft:config cities.City7.name set value "Fronteria"

# Victory point values per city
data modify storage mythcraft:config cities.City1.vpValue set value 2
data modify storage mythcraft:config cities.City2.vpValue set value 2
data modify storage mythcraft:config cities.City3.vpValue set value 1
data modify storage mythcraft:config cities.City4.vpValue set value 1
data modify storage mythcraft:config cities.City5.vpValue set value 1
data modify storage mythcraft:config cities.City6.vpValue set value 1
data modify storage mythcraft:config cities.City7.vpValue set value 1

# Skill location display names
data modify storage mythcraft:config skillLocations.Attack.name set value "Colosseum"
data modify storage mythcraft:config skillLocations.Defense.name set value "Fort-Reference"
data modify storage mythcraft:config skillLocations.Magic.name set value "Thoth-University"
data modify storage mythcraft:config skillLocations.Special.name set value "Athena-Library"

# City teleport coordinates
data modify storage mythcraft:config cities.City1.teleport set value {x:10,y:-60,z:-7,yaw:-116,pitch:3}
data modify storage mythcraft:config cities.City2.teleport set value {x:1,y:-60,z:-14,yaw:138,pitch:-5}
data modify storage mythcraft:config cities.City3.teleport set value {x:-18,y:-60,z:-2,yaw:68,pitch:6}
data modify storage mythcraft:config cities.City4.teleport set value {x:-6,y:-60,z:14,yaw:-27,pitch:-1}
data modify storage mythcraft:config cities.City5.teleport set value {x:-32,y:-60,z:24,yaw:-137,pitch:1}
data modify storage mythcraft:config cities.City6.teleport set value {x:7,y:-60,z:12,yaw:-41,pitch:2}
data modify storage mythcraft:config cities.City7.teleport set value {x:23,y:-60,z:8,yaw:-60,pitch:3}

# Skill location teleport coordinates
data modify storage mythcraft:config skillLocations.Attack.teleport set value {x:18,y:-60,z:-31,yaw:158,pitch:4}
data modify storage mythcraft:config skillLocations.Defense.teleport set value {x:-8,y:-60,z:-36,yaw:123,pitch:2}
data modify storage mythcraft:config skillLocations.Magic.teleport set value {x:-36,y:-60,z:5,yaw:111,pitch:-1}
data modify storage mythcraft:config skillLocations.Special.teleport set value {x:-18,y:-60,z:-21,yaw:90,pitch:3}

# Number of active cities
data modify storage mythcraft:config cityCount set value 7

# Tiebreak city
data modify storage mythcraft:config tiebreakCity set value "City3"

# City troop configuration
# City1 (Celak): Vindicators, Archers, Breeze
data modify storage mythcraft:config cities.City1.troopCap set value 4
data modify storage mythcraft:config cities.City1.bossCap set value 0
data modify storage mythcraft:config cities.City1.regularPool set value ["vindicator","skeleton"]
data modify storage mythcraft:config cities.City1.bossPool set value ["breeze"]

# City2 (Kings-Port): Vindicators, Pillagers, Illusioners
data modify storage mythcraft:config cities.City2.troopCap set value 2
data modify storage mythcraft:config cities.City2.bossCap set value 1
data modify storage mythcraft:config cities.City2.regularPool set value ["vindicator","pillager"]
data modify storage mythcraft:config cities.City2.bossPool set value ["illusioner"]

# City3 (Athens): Undead, Archers, Large Archers, Breeze
data modify storage mythcraft:config cities.City3.troopCap set value 0
data modify storage mythcraft:config cities.City3.bossCap set value 1
data modify storage mythcraft:config cities.City3.regularPool set value ["zombie","skeleton"]
data modify storage mythcraft:config cities.City3.bossPool set value ["bossskeleton","breeze"]

# City4 (Delphi): Witch, Large Undead, Blaze
data modify storage mythcraft:config cities.City4.troopCap set value 0
data modify storage mythcraft:config cities.City4.bossCap set value 1
data modify storage mythcraft:config cities.City4.regularPool set value ["witch"]
data modify storage mythcraft:config cities.City4.bossPool set value ["bosszombie","blaze"]

# City5 (Loserville): Vindicators, Archers, Large Witch, Illusioner
data modify storage mythcraft:config cities.City5.troopCap set value 0
data modify storage mythcraft:config cities.City5.bossCap set value 1
data modify storage mythcraft:config cities.City5.regularPool set value ["vindicator","skeleton"]
data modify storage mythcraft:config cities.City5.bossPool set value ["bosswitch","illusioner"]

# City6 (Amnis): Pillagers, Large Undead, Breeze
data modify storage mythcraft:config cities.City6.troopCap set value 0
data modify storage mythcraft:config cities.City6.bossCap set value 1
data modify storage mythcraft:config cities.City6.regularPool set value ["pillager"]
data modify storage mythcraft:config cities.City6.bossPool set value ["bosszombie","breeze"]

# City7 (Fronteria): Witch, Large Archers, Blaze
data modify storage mythcraft:config cities.City7.troopCap set value 1
data modify storage mythcraft:config cities.City7.bossCap set value 0
data modify storage mythcraft:config cities.City7.regularPool set value ["witch"]
data modify storage mythcraft:config cities.City7.bossPool set value ["bossskeleton","blaze"]

# Skill location troop configuration
# Attack (Colosseum): Vindicators, Pillagers, Large Archer, Large Undead
data modify storage mythcraft:config skillLocations.Attack.troopCap set value 5
data modify storage mythcraft:config skillLocations.Attack.bossCap set value 0
data modify storage mythcraft:config skillLocations.Attack.regularPool set value ["vindicator","pillager"]
data modify storage mythcraft:config skillLocations.Attack.bossPool set value ["bossskeleton","bosszombie"]

# Defense (Fort Reference): Vindicators, Pillagers, Large Archer, Large Undead
data modify storage mythcraft:config skillLocations.Defense.troopCap set value 5
data modify storage mythcraft:config skillLocations.Defense.bossCap set value 0
data modify storage mythcraft:config skillLocations.Defense.regularPool set value ["vindicator","pillager"]
data modify storage mythcraft:config skillLocations.Defense.bossPool set value ["bossskeleton","bosszombie"]

# Magic (Thoth University): Witch, Undead, Archer, Illusioner, Blaze
data modify storage mythcraft:config skillLocations.Magic.troopCap set value 5
data modify storage mythcraft:config skillLocations.Magic.bossCap set value 0
data modify storage mythcraft:config skillLocations.Magic.regularPool set value ["witch","zombie","skeleton"]
data modify storage mythcraft:config skillLocations.Magic.bossPool set value ["illusioner","blaze"]

# Special (Athena Library): Witch, Archer, Large Witch, Breeze
data modify storage mythcraft:config skillLocations.Special.troopCap set value 5
data modify storage mythcraft:config skillLocations.Special.bossCap set value 0
data modify storage mythcraft:config skillLocations.Special.regularPool set value ["witch","skeleton"]
data modify storage mythcraft:config skillLocations.Special.bossPool set value ["bosswitch","breeze"]

# Game timing (durations in seconds)
data modify storage mythcraft:config game.questCount set value 5
data modify storage mythcraft:config game.questDuration set value 300
data modify storage mythcraft:config game.betweenQuestDelay set value 10
data modify storage mythcraft:config game.preGameDuration set value 300
data modify storage mythcraft:config game.endgameDuration set value 300
data modify storage mythcraft:config game.vpQuestCount set value 2

# Regen timing
data modify storage mythcraft:config game.regenCheckInterval set value 60
data modify storage mythcraft:config game.regenInterval set value 20
data modify storage mythcraft:config game.skillRegenInterval set value 20

# Unaligned
data modify storage mythcraft:config teams.Unaligned.name set value "Unaligned"
data modify storage mythcraft:config teams.Unaligned.color set value "#FFD700"

# Team 1 configuration
data modify storage mythcraft:config teams.Team1.id set value "Team1"
data modify storage mythcraft:config teams.Team1.name set value "Druids"
data modify storage mythcraft:config teams.Team1.color set value "green"
data modify storage mythcraft:config teams.Team1.trimMaterial set value "emerald"
data modify storage mythcraft:config teams.Team1.trimPatternHead set value "silence"
data modify storage mythcraft:config teams.Team1.trimPattern set value "wild"

# Team 2 configuration
data modify storage mythcraft:config teams.Team2.id set value "Team2"
data modify storage mythcraft:config teams.Team2.name set value "Royals"
data modify storage mythcraft:config teams.Team2.color set value "blue"
data modify storage mythcraft:config teams.Team2.trimMaterial set value "lapis"
data modify storage mythcraft:config teams.Team2.trimPatternHead set value "silence"
data modify storage mythcraft:config teams.Team2.trimPattern set value "sentry"

# Re-apply display settings
function mythcraft:config/refresh
