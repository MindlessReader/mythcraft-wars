$execute as @s[team=Druids] run scoreboard players add Druids xp$(locationName) 1
$execute as @s[team=Royals] run scoreboard players add Royals xp$(locationName) 1

# call levelup function at thresholds
$execute as @s[team=Druids] if score Druids xp$(locationName) = Threshold1 xpThresholds run function mythcraft:leveling/skills/levelup {locationName: $(locationName)}
$execute as @s[team=Royals] if score Royals xp$(locationName) = Threshold1 xpThresholds run function mythcraft:leveling/skills/levelup {locationName: $(locationName)}
$execute as @s[team=Druids] if score Druids xp$(locationName) = Threshold2 xpThresholds run function mythcraft:leveling/skills/levelup {locationName: $(locationName)}
$execute as @s[team=Royals] if score Royals xp$(locationName) = Threshold2 xpThresholds run function mythcraft:leveling/skills/levelup {locationName: $(locationName)}
$execute as @s[team=Druids] if score Druids xp$(locationName) = Threshold3 xpThresholds run function mythcraft:leveling/skills/levelup {locationName: $(locationName)}
$execute as @s[team=Royals] if score Royals xp$(locationName) = Threshold3 xpThresholds run function mythcraft:leveling/skills/levelup {locationName: $(locationName)}
$execute as @s[team=Druids] if score Druids xp$(locationName) = Threshold4 xpThresholds run function mythcraft:leveling/skills/levelup {locationName: $(locationName)}
$execute as @s[team=Royals] if score Royals xp$(locationName) = Threshold4 xpThresholds run function mythcraft:leveling/skills/levelup {locationName: $(locationName)}
$execute as @s[team=Druids] if score Druids xp$(locationName) = Threshold5 xpThresholds run function mythcraft:leveling/skills/levelup {locationName: $(locationName)}
$execute as @s[team=Royals] if score Royals xp$(locationName) = Threshold5 xpThresholds run function mythcraft:leveling/skills/levelup {locationName: $(locationName)}

# if current quest is here, add to kill counter
$execute if score $(locationName) locationId = QuestTracker questLocation as @s[team=Druids] run scoreboard players add Druids questKills 1
$execute if score $(locationName) locationId = QuestTracker questLocation as @s[team=Royals] run scoreboard players add Royals questKills 1

$advancement revoke @s only mythcraft:kill/skilllocations/$(advancementName)

# respawn troops if not many left
$scoreboard players reset $(locationName) mathCounter
$execute as @e[tag=cityTroop,tag=$(locationName)] run scoreboard players add $(locationName) mathCounter 1
$execute if score $(locationName) mathCounter matches ..3 run function mythcraft:respawn/spawnall {cityName:$(locationName), teamName:Unaligned}