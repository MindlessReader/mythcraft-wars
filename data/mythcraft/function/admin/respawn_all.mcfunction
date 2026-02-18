# Respawn all troops at all locations
scoreboard players set @s adminAction 0
function mythcraft:respawn/masterspawn
tellraw @s {text:"[Admin] All troops respawned.",color:"green"}
function mythcraft:admin/open
