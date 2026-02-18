# Enter marker counting mode
scoreboard players set @s adminAction 0

# Tag the admin as active
tag @s add markerHelperActive

# Set up the markerCount scoreboard display
scoreboard players set Regular markerCount 0
scoreboard players set Boss markerCount 0
scoreboard players set RaidBoss markerCount 0
scoreboard objectives setdisplay sidebar markerCount

# Run initial count
function mythcraft:admin/marker/count with storage mythcraft:admin

# Show exit button in chat
function mythcraft:admin/marker/show_exit_button with storage mythcraft:admin

# Clean up nearest marker tag
tag @e[tag=_nearestMarker] remove _nearestMarker
