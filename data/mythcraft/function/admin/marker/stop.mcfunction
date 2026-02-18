# Stop marker counting mode
scoreboard players set @s adminAction 0

# Read final counts for report
execute store result storage mythcraft:admin finalRegular int 1 run scoreboard players get Regular markerCount
execute store result storage mythcraft:admin finalBoss int 1 run scoreboard players get Boss markerCount
execute store result storage mythcraft:admin finalRaidBoss int 1 run scoreboard players get RaidBoss markerCount

# Report final counts
function mythcraft:admin/marker/report with storage mythcraft:admin

# Restore sidebar
scoreboard objectives setdisplay sidebar display

# Clean up
tag @s remove markerHelperActive
