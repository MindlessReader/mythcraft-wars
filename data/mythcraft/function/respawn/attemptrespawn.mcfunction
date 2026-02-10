# check if markers are loaded using passed in parameters, then either kill and call spawnall or schedule next callback using passed in parameters
$execute store result score EntityCount mathCounter if entity @e[type=marker,tag=spawnmarker,tag=$(cityName)]

#schedule next run and return early if markers not found
$execute unless score EntityCount mathCounter = $(cityName) cityConquerValue run schedule function mythcraft:respawn/callback/$(callbackName) 15s
$execute unless score EntityCount mathCounter = $(cityName) cityConquerValue run return fail

# call spawn function
$execute if score $(cityName) cityOwnership matches 0 run function mythcraft:respawn/spawnall {cityName:$(cityName), teamName:Unaligned, cityDisplayName:$(cityDisplayName)}
$execute if score $(cityName) cityOwnership matches 1 run function mythcraft:respawn/spawnall {cityName:$(cityName), teamName:Team1, cityDisplayName:$(cityDisplayName)}
$execute if score $(cityName) cityOwnership matches 2 run function mythcraft:respawn/spawnall {cityName:$(cityName), teamName:Team2, cityDisplayName:$(cityDisplayName)}

# announce regrouping - unaligned uses literal text
$execute if score $(cityName) cityOwnership matches 0 run tellraw @a [{color:"#FFD700",bold:false,text:"Unaligned"},{color:"#FFD700",text:" troops have regrouped in "},{bold:false,color:"white",text:"$(cityDisplayName)"},{color:"#FFD700",text:"!"}]

# announce regrouping - team-owned cities need resolved team display name
$data modify storage mythcraft:temp cityDisplayName set value "$(cityDisplayName)"
$execute if score $(cityName) cityOwnership matches 1 run data modify storage mythcraft:temp teamName set from storage mythcraft:config teams.Team1.name
$execute if score $(cityName) cityOwnership matches 1 run data modify storage mythcraft:temp teamColor set from storage mythcraft:config teams.Team1.color
$execute if score $(cityName) cityOwnership matches 2 run data modify storage mythcraft:temp teamName set from storage mythcraft:config teams.Team2.name
$execute if score $(cityName) cityOwnership matches 2 run data modify storage mythcraft:temp teamColor set from storage mythcraft:config teams.Team2.color
$execute if score $(cityName) cityOwnership matches 1..2 run function mythcraft:respawn/attemptrespawn_announce with storage mythcraft:temp

# reset conquer progress and last checked value
$scoreboard players set $(cityName) cityConquerProgress 0
$scoreboard players set $(cityName)LastChecked cityConquerProgress 0
