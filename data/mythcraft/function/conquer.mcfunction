# set ownership
$scoreboard players set $(cityName) cityOwnership $(teamId)

# if current quest is to capture this city, set current quest winner to this team and call quest end
$execute if score QuestTracker questLocation = $(cityName) locationId run scoreboard players set QuestTracker questWinner $(teamId)
$execute if score QuestTracker questLocation = $(cityName) locationId run function mythcraft:quests/conquerquestattackreward {cityName:$(cityName), teamId:$(teamId), teamName:$(teamName)}

# respawn troops
$function mythcraft:respawn/spawnall {cityName:$(cityName), teamName:$(teamName)}

# reset conquer score
$scoreboard players set $(cityName) cityConquerProgress 0
$scoreboard players set $(cityName)LastChecked cityConquerProgress 0
$say The $(teamName) have conquered $(cityName)!

# add to player's cities conquered statistic (for fun)
scoreboard players add @s citiesConquered 1