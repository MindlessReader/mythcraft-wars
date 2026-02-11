# World-level configuration for Mythcraft Wars
# Edit this file to customize city names, VP values, and other settings for your world

# City display names (shown to players in announcements, troop names, etc.)
data modify storage mythcraft:config cities.City1.name set value "Celak"
data modify storage mythcraft:config cities.City2.name set value "Kings-Port"
data modify storage mythcraft:config cities.City3.name set value "Athens"
data modify storage mythcraft:config cities.City4.name set value "Delphi"
data modify storage mythcraft:config cities.City5.name set value "Loserville"
data modify storage mythcraft:config cities.City6.name set value "Amnis"
data modify storage mythcraft:config cities.City7.name set value "Fronteria"

# Victory point values per city (awarded to the owning team at endgame)
data modify storage mythcraft:config cities.City1.vpValue set value 2
data modify storage mythcraft:config cities.City2.vpValue set value 2
data modify storage mythcraft:config cities.City3.vpValue set value 1
data modify storage mythcraft:config cities.City4.vpValue set value 1
data modify storage mythcraft:config cities.City5.vpValue set value 1
data modify storage mythcraft:config cities.City6.vpValue set value 1
data modify storage mythcraft:config cities.City7.vpValue set value 1

# Skill location display names (shown to players in announcements, troop names, etc.)
data modify storage mythcraft:config skillLocations.Attack.name set value "Colosseum"
data modify storage mythcraft:config skillLocations.Defense.name set value "Fort-Reference"
data modify storage mythcraft:config skillLocations.Magic.name set value "Thoth-University"
data modify storage mythcraft:config skillLocations.Special.name set value "Athena-Library"

# Teleport coordinates (admin should set these to actual world locations)
data modify storage mythcraft:config cities.City1.teleport set value {x:0,y:64,z:0,yaw:0,pitch:0}
data modify storage mythcraft:config cities.City2.teleport set value {x:0,y:64,z:0,yaw:0,pitch:0}
data modify storage mythcraft:config cities.City3.teleport set value {x:0,y:64,z:0,yaw:0,pitch:0}
data modify storage mythcraft:config cities.City4.teleport set value {x:0,y:64,z:0,yaw:0,pitch:0}
data modify storage mythcraft:config cities.City5.teleport set value {x:0,y:64,z:0,yaw:0,pitch:0}
data modify storage mythcraft:config cities.City6.teleport set value {x:0,y:64,z:0,yaw:0,pitch:0}
data modify storage mythcraft:config cities.City7.teleport set value {x:0,y:64,z:0,yaw:0,pitch:0}
data modify storage mythcraft:config skillLocations.Attack.teleport set value {x:0,y:64,z:0,yaw:0,pitch:0}
data modify storage mythcraft:config skillLocations.Defense.teleport set value {x:0,y:64,z:0,yaw:0,pitch:0}
data modify storage mythcraft:config skillLocations.Magic.teleport set value {x:0,y:64,z:0,yaw:0,pitch:0}
data modify storage mythcraft:config skillLocations.Special.teleport set value {x:0,y:64,z:0,yaw:0,pitch:0}

# Number of active cities
data modify storage mythcraft:config cityCount set value 7

# Tiebreak city (if VP tied at endgame, owner of this city gets +1 VP)
data modify storage mythcraft:config tiebreakCity set value "City3"

# Unaligned (initial state for unclaimed cities)
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
