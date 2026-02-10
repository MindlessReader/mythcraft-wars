# One-time migration: re-tag existing marker entities from old skill location names to new generic names
# Run this once after updating the datapack, then delete this file

# Markers
tag @e[type=marker,tag=Colosseum] add Attack
tag @e[type=marker,tag=Colosseum] remove Colosseum

tag @e[type=marker,tag=Fort-Reference] add Defense
tag @e[type=marker,tag=Fort-Reference] remove Fort-Reference

tag @e[type=marker,tag=Thoth-University] add Magic
tag @e[type=marker,tag=Thoth-University] remove Thoth-University

tag @e[type=marker,tag=Athena-Library] add Special
tag @e[type=marker,tag=Athena-Library] remove Athena-Library

# Also remove old camelCase variants used in setcity
tag @e[type=marker,tag=FortReference] add Defense
tag @e[type=marker,tag=FortReference] remove FortReference

tag @e[type=marker,tag=ThothUniversity] add Magic
tag @e[type=marker,tag=ThothUniversity] remove ThothUniversity

tag @e[type=marker,tag=AthenaLibrary] add Special
tag @e[type=marker,tag=AthenaLibrary] remove AthenaLibrary

# City markers: re-tag from world-specific names to generic IDs
tag @e[type=marker,tag=Celak] add City1
tag @e[type=marker,tag=Celak] remove Celak

tag @e[type=marker,tag=Kings-Port] add City2
tag @e[type=marker,tag=Kings-Port] remove Kings-Port

tag @e[type=marker,tag=Athens] add City3
tag @e[type=marker,tag=Athens] remove Athens

tag @e[type=marker,tag=Delphi] add City4
tag @e[type=marker,tag=Delphi] remove Delphi

tag @e[type=marker,tag=Povertane] add City5
tag @e[type=marker,tag=Povertane] remove Povertane

tag @e[type=marker,tag=Amnis] add City6
tag @e[type=marker,tag=Amnis] remove Amnis

tag @e[type=marker,tag=Fronteria] add City7
tag @e[type=marker,tag=Fronteria] remove Fronteria

# Team rename: Druids → Team1, Royals → Team2
# Existing troops have old team assignments baked in via Team:"Druids"/Team:"Royals"
# Re-teaming entities in-place is not supported, so kill and respawn all troops
team modify Druids friendlyFire true
team modify Royals friendlyFire true
kill @e[tag=cityTroop]

# Migrate team assignments on all players
team join Team1 @a[team=Druids]
team join Team2 @a[team=Royals]

# Remove old teams
team remove Druids
team remove Royals

# Migrate breath spell AEC tags
tag @e[tag=breath_ownerdruids] add breath_ownerteam1
tag @e[tag=breath_ownerdruids] remove breath_ownerdruids
tag @e[tag=breath_ownerroyals] add breath_ownerteam2
tag @e[tag=breath_ownerroyals] remove breath_ownerroyals

tellraw @a [{color:"green",text:"[Migration] All tags migrated. Run /function mythcraft:respawn/masterspawn to respawn troops."}]
