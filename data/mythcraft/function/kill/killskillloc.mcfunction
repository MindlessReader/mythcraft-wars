# character XP for individual progression
scoreboard players operation @s characterXP += TroopKill characterXPReward
function mythcraft:leveling/character/checklevel

$execute as @s[team=Team1] run scoreboard players add Team1 xp$(locationName) 1
$execute as @s[team=Team2] run scoreboard players add Team2 xp$(locationName) 1

# call levelup function at thresholds
$execute as @s[team=Team1] if score Team1 xp$(locationName) = Threshold1 xpThresholds run function mythcraft:leveling/skills/levelup {locationName: $(locationName)}
$execute as @s[team=Team2] if score Team2 xp$(locationName) = Threshold1 xpThresholds run function mythcraft:leveling/skills/levelup {locationName: $(locationName)}
$execute as @s[team=Team1] if score Team1 xp$(locationName) = Threshold2 xpThresholds run function mythcraft:leveling/skills/levelup {locationName: $(locationName)}
$execute as @s[team=Team2] if score Team2 xp$(locationName) = Threshold2 xpThresholds run function mythcraft:leveling/skills/levelup {locationName: $(locationName)}
$execute as @s[team=Team1] if score Team1 xp$(locationName) = Threshold3 xpThresholds run function mythcraft:leveling/skills/levelup {locationName: $(locationName)}
$execute as @s[team=Team2] if score Team2 xp$(locationName) = Threshold3 xpThresholds run function mythcraft:leveling/skills/levelup {locationName: $(locationName)}
$execute as @s[team=Team1] if score Team1 xp$(locationName) = Threshold4 xpThresholds run function mythcraft:leveling/skills/levelup {locationName: $(locationName)}
$execute as @s[team=Team2] if score Team2 xp$(locationName) = Threshold4 xpThresholds run function mythcraft:leveling/skills/levelup {locationName: $(locationName)}
$execute as @s[team=Team1] if score Team1 xp$(locationName) = Threshold5 xpThresholds run function mythcraft:leveling/skills/levelup {locationName: $(locationName)}
$execute as @s[team=Team2] if score Team2 xp$(locationName) = Threshold5 xpThresholds run function mythcraft:leveling/skills/levelup {locationName: $(locationName)}

# if current quest is here, add to kill counter
$execute if score $(locationName) locationId = QuestTracker questLocation as @s[team=Team1] run scoreboard players add Team1 questKills 1
$execute if score $(locationName) locationId = QuestTracker questLocation as @s[team=Team2] run scoreboard players add Team2 questKills 1

$advancement revoke @s only mythcraft:kill/skilllocations/$(advancementName)

# respawn troops if not many left
$scoreboard players reset $(locationName) mathCounter
$execute as @e[tag=cityTroop,tag=$(locationName)] run scoreboard players add $(locationName) mathCounter 1
$execute if score $(locationName) mathCounter matches ..3 run function mythcraft:respawn/spawnall {cityName:$(locationName), teamName:Unaligned, cityDisplayName:$(locationDisplayName)}
