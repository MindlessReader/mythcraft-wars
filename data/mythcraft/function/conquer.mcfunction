# set ownership
$scoreboard players set $(cityId) cityOwnership $(teamId)
$function mythcraft:setup/sidebar_color {cityId:$(cityId), teamName:$(teamName)}

# grant benefits
$execute as @a[team=$(teamName)] run function mythcraft:kill/giveequipment/$(rewardFunction)

# if current quest is to capture this city and is active, set current quest winner to this team and call quest end
$execute if score QuestTracker questWinner matches 0 if score QuestTracker questLocation = $(cityId) locationId run function mythcraft:quests/conquerquestattackreward {cityName:$(cityId), teamId:$(teamId), teamName:$(teamName)}

# respawn troops
$function mythcraft:respawn/spawnall {cityName:$(cityId), teamName:$(teamName), cityDisplayName:$(cityDisplayName)}
$execute if score QuestTracker endGame matches 0 run effect give @e[type=!marker,tag=$(cityId)] resistance 60 4

# reset conquer score
$scoreboard players set $(cityId) cityConquerProgress 0
$scoreboard players set $(cityId)LastChecked cityConquerProgress 0

# resolve team display name for announcements
$data modify storage mythcraft:temp teamDisplayName set from storage mythcraft:config teams.$(teamName).name
$data modify storage mythcraft:temp teamColor set from storage mythcraft:config teams.$(teamName).color
$data modify storage mythcraft:temp cityDisplayName set value "$(cityDisplayName)"
$data modify storage mythcraft:temp cityId set value "$(cityId)"
$data modify storage mythcraft:temp teamName set value "$(teamName)"
function mythcraft:conquer_announce with storage mythcraft:temp

$execute if score $(cityId) cityOwnership matches 2 as @s[team=Team1] as @a[team=Team1] at @s run playsound minecraft:entity.wither.death master @s ~ ~ ~
$execute if score $(cityId) cityOwnership matches 1 as @s[team=Team2] as @a[team=Team2] at @s run playsound minecraft:entity.wither.death master @s ~ ~ ~

$execute if score $(cityId) cityOwnership matches 1 as @s[team=Team1] as @a[team=Team1] at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 100
$execute if score $(cityId) cityOwnership matches 2 as @s[team=Team2] as @a[team=Team2] at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 100

# add to player's cities conquered statistic (for fun)
scoreboard players add @s citiesConquered 1
