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

# Game timing (durations in seconds)
data modify storage mythcraft:config game.questCount set value 1
data modify storage mythcraft:config game.questDuration set value 30
data modify storage mythcraft:config game.betweenQuestDelay set value 50
data modify storage mythcraft:config game.preGameDuration set value 1
data modify storage mythcraft:config game.endgameDuration set value 100
data modify storage mythcraft:config game.vpQuestCount set value 1

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
