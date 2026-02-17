# character XP for individual progression
scoreboard players operation @s characterXP += TroopKill characterXPReward
function mythcraft:leveling/character/checklevel
# assassin totem charge (+1 for troop kills)
execute if score @s playerClass matches 2 run function mythcraft:totem/charge {amount:1}

$execute as @s[team=Team1] run scoreboard players operation Team1 xp$(locationName) += TroopKill skillXPReward
$execute as @s[team=Team2] run scoreboard players operation Team2 xp$(locationName) += TroopKill skillXPReward

# check for level-ups (uses >= instead of = to handle skipped thresholds)
$function mythcraft:leveling/skills/checklevel {locationName: $(locationName)}

# if current quest is here, add to kill counter
$execute if score $(locationName) locationId = QuestTracker questLocation as @s[team=Team1] run scoreboard players add Team1 questKills 1
$execute if score $(locationName) locationId = QuestTracker questLocation as @s[team=Team2] run scoreboard players add Team2 questKills 1

$advancement revoke @s only mythcraft:kill/skilllocations/$(advancementName)

# decrement the correct troop count based on category (respawn pass handles actual spawning)
$execute if data storage mythcraft:temp {troopCategory:"regular"} run scoreboard players remove $(locationName) troopCount 1
$execute if data storage mythcraft:temp {troopCategory:"boss"} run scoreboard players remove $(locationName) bossCount 1
