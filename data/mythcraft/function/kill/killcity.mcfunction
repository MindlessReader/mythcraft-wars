# Handle city troop kill
# Params: $(cityName), $(advancementName), $(troopCategory), $(cityDisplayName)

# Character XP for individual progression (only for enemy troop kills)
$execute unless score $(cityName) cityOwnership matches 1 as @s[team=Team1] run scoreboard players operation @s characterXP += TroopKill characterXPReward
$execute unless score $(cityName) cityOwnership matches 2 as @s[team=Team2] run scoreboard players operation @s characterXP += TroopKill characterXPReward
function mythcraft:leveling/character/checklevel

# Assassin totem charge (+1 for enemy troop kills only)
$execute unless score $(cityName) cityOwnership matches 1 if score @s playerClass matches 2 as @s[team=Team1] run function mythcraft:totem/charge {amount:1}
$execute unless score $(cityName) cityOwnership matches 2 if score @s playerClass matches 2 as @s[team=Team2] run function mythcraft:totem/charge {amount:1}

# If player killed a mob on their own team, spawn a random replacement (does not affect counts)
$execute if score $(cityName) cityOwnership matches 1 as @s[team=Team1] run function mythcraft:respawn/spawn_friendly {cityName:$(cityName), teamName:Team1, cityDisplayName:$(cityDisplayName)}
$execute if score $(cityName) cityOwnership matches 2 as @s[team=Team2] run function mythcraft:respawn/spawn_friendly {cityName:$(cityName), teamName:Team2, cityDisplayName:$(cityDisplayName)}

# Decrement troop count (enemy kills only)
$execute unless score $(cityName) cityOwnership matches 1 as @s[team=Team1] run function mythcraft:kill/decrement_count {cityName:$(cityName)}
$execute unless score $(cityName) cityOwnership matches 2 as @s[team=Team2] run function mythcraft:kill/decrement_count {cityName:$(cityName)}

# Check for conquest (both troopCount and bossCount at 0)
$execute unless score $(cityName) cityOwnership matches 1 if score $(cityName) troopCount matches ..0 if score $(cityName) bossCount matches ..0 as @s[team=Team1] run function mythcraft:conquer {cityId:$(cityName), teamId:1, teamName:Team1, cityDisplayName:$(cityDisplayName)}
$execute unless score $(cityName) cityOwnership matches 2 if score $(cityName) troopCount matches ..0 if score $(cityName) bossCount matches ..0 as @s[team=Team2] run function mythcraft:conquer {cityId:$(cityName), teamId:2, teamName:Team2, cityDisplayName:$(cityDisplayName)}

# Revoke advancement for reuse
$advancement revoke @s only mythcraft:kill/city/$(advancementName)
