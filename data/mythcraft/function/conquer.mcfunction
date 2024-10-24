# set ownership
$scoreboard players set $(cityName) cityOwnership $(teamId)
$team join $(teamName) $(cityName)

# grant benefits
$execute as @a[team=$(teamName)] run function mythcraft:kill/giveequipment/$(rewardFunction)

# if current quest is to capture this city and is active, set current quest winner to this team and call quest end
$execute if score QuestTracker questWinner matches 0 if score QuestTracker questLocation = $(cityName) locationId run function mythcraft:quests/conquerquestattackreward {cityName:$(cityName), teamId:$(teamId), teamName:$(teamName)}

# respawn troops
$function mythcraft:respawn/spawnall {cityName:$(cityName), teamName:$(teamName)}
$execute if score QuestTracker endGame matches 0 run effect give @e[type=!marker,tag=$(cityName)] resistance 60 4

# reset conquer score
$scoreboard players set $(cityName) cityConquerProgress 0
$scoreboard players set $(cityName)LastChecked cityConquerProgress 0

# announce
$tellraw @a [{"color":"yellow","text":"The "},{"bold":true,"text":"$(teamName)"},{"color":"yellow","text":" have conquered "},{"bold":true,"text":"$(cityName)"},{"color":"yellow","text":"!"}]

$execute if score $(cityName) cityOwnership matches 2 as @s[team=Druids] as @a[team=Druids] run title @p title {"color":"dark_red","text":"Lost $(cityName)"}
$execute if score $(cityName) cityOwnership matches 1 as @s[team=Royals] as @a[team=Royals] run title @p title {"color":"dark_red","text":"Lost $(cityName)"}
$execute if score $(cityName) cityOwnership matches 2 if score QuestTracker endGame matches 0 as @s[team=Druids] as @a[team=Druids] run title @p subtitle {"color":"dark_purple","text":"Enemy troops in the city will be invulnerable for 1 minute"}
$execute if score $(cityName) cityOwnership matches 1 if score QuestTracker endGame matches 0 as @s[team=Royals] as @a[team=Royals] run title @p subtitle {"color":"dark_purple","text":"Enemy troops in the city will be invulnerable for 1 minute"}
$execute if score $(cityName) cityOwnership matches 2 if score QuestTracker endGame matches 1 as @s[team=Druids] as @a[team=Druids] run title @p subtitle {"color":"dark_purple","text":"Enemy troops in the city can be killed again immediately"}
$execute if score $(cityName) cityOwnership matches 1 if score QuestTracker endGame matches 1 as @s[team=Royals] as @a[team=Royals] run title @p subtitle {"color":"dark_purple","text":"Enemy troops in the city can be killed again immediately"}


$execute if score $(cityName) cityOwnership matches 2 as @s[team=Druids] as @a[team=Druids] at @s run playsound minecraft:entity.wither.death master @s ~ ~ ~
$execute if score $(cityName) cityOwnership matches 1 as @s[team=Royals] as @a[team=Royals] at @s run playsound minecraft:entity.wither.death master @s ~ ~ ~

$execute if score $(cityName) cityOwnership matches 1 as @s[team=Druids] as @a[team=Druids] at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 100
$execute if score $(cityName) cityOwnership matches 2 as @s[team=Royals] as @a[team=Royals] at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 100

# add to player's cities conquered statistic (for fun)
scoreboard players add @s citiesConquered 1