# character XP for individual progression
scoreboard players operation @s characterXP += TroopKill characterXPReward
function mythcraft:leveling/character/checklevel

$execute as @s[team=Team1] run scoreboard players operation Team1 xp$(locationName) += TroopKill skillXPReward
$execute as @s[team=Team2] run scoreboard players operation Team2 xp$(locationName) += TroopKill skillXPReward

# check for level-ups (uses >= instead of = to handle skipped thresholds)
$function mythcraft:leveling/skills/checklevel {locationName: $(locationName)}

# if current quest is here, add to kill counter
$execute if score $(locationName) locationId = QuestTracker questLocation as @s[team=Team1] run scoreboard players add Team1 questKills 1
$execute if score $(locationName) locationId = QuestTracker questLocation as @s[team=Team2] run scoreboard players add Team2 questKills 1

$advancement revoke @s only mythcraft:kill/skilllocations/$(advancementName)

# respawn troops if not many left
$scoreboard players reset $(locationName) mathCounter
$execute as @e[tag=cityTroop,tag=$(locationName)] run scoreboard players add $(locationName) mathCounter 1
$execute if score $(locationName) mathCounter matches ..3 run function mythcraft:respawn/spawnall {cityName:$(locationName), teamName:Unaligned, cityDisplayName:$(locationDisplayName)}
