# Set XP level and bar fill from macro parameters
# Macro function — called with {troopTotal:N, troopFill:N}
$xp set @s $(troopTotal) levels
$xp set @s $(troopFill) points
