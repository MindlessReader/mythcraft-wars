# check if markers are loaded using passed in parameters, then either kill and call spawnall or schedule next callback using passed in parameters
$execute store result score EntityCount mathCounter if entity @e[type=marker,tag=spawnmarker,tag=$(cityName)]

#schedule next run and return early if markers not found
$execute unless score EntityCount mathCounter = $(cityName) cityConquerValue run schedule function mythcraft:respawn/callback/$(callbackName) 15s
$execute unless score EntityCount mathCounter = $(cityName) cityConquerValue run return fail

# call spawn function
$execute if score EntityCount mathCounter = $(cityName) cityConquerValue if score $(cityName) cityOwnership matches 0 run function mythcraft:respawn/spawnall {cityName:$(cityName), teamName:Unaligned}
$execute if score EntityCount mathCounter = $(cityName) cityConquerValue if score $(cityName) cityOwnership matches 1 run function mythcraft:respawn/spawnall {cityName:$(cityName), teamName:Druids}
$execute if score EntityCount mathCounter = $(cityName) cityConquerValue if score $(cityName) cityOwnership matches 2 run function mythcraft:respawn/spawnall {cityName:$(cityName), teamName:Royals}

# reset conquer progress
$scoreboard players set $(cityName) cityConquerProgress 0