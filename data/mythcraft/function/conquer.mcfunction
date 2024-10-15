# set ownership
$scoreboard players set $(cityName) cityOwnership $(teamId)

# respawn troops
$function mythcraft:respawn/spawnall {cityName:$(cityName), teamName:$(teamName)}

# reset conquer score
$scoreboard players set $(cityName) cityConquerProgress 0
$say The $(teamName) have conquered $(cityName)!