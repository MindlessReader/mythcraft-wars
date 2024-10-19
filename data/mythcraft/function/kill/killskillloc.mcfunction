$execute as @s[team=Druids] run scoreboard players add Druids xp$(locationName) 1
$execute as @s[team=Royals] run scoreboard players add Royals xp$(locationName) 1

# this will be replaced with a call to a levelup function when the xp hits a certain value
#$execute if score $(locationName) cityConquerProgress >= $(locationName) cityConquerValue as @s[team=Druids] run function mythcraft:conquer {cityName:$(locationName), teamId:1, teamName:Druids}
#$execute if score $(locationName) cityConquerProgress >= $(locationName) cityConquerValue as @s[team=Royals] run function mythcraft:conquer {cityName:$(locationName), teamId:2, teamName:Royals}

# if current quest is here, add to kill counter
$execute if score $(locationName) locationId = QuestTracker questLocation as @s[team=Druids] run scoreboard players add Druids questKills 1
$execute if score $(locationName) locationId = QuestTracker questLocation as @s[team=Royals] run scoreboard players add Royals questKills 1

$advancement revoke @s only mythcraft:kill/skilllocations/$(advancementName)