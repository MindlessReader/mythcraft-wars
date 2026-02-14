# Cancel active totem stealth (called by rekit/selectclass)
# Restore visuals defensively, then clear effects and timer
function mythcraft:totem/show_armor
effect clear @s invisibility
effect clear @s speed
scoreboard players reset @s totemInvisTimer
