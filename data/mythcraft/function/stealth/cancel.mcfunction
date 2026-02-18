# Cancel active stealth (called by rekit/selectclass)
# Restore armor visuals, clear invisibility, reset timer
# Does NOT clear speed — callers handle totem-specific effects
function mythcraft:stealth/show_armor
effect clear @s invisibility
scoreboard players reset @s stealthTimer
