# Dispatch to the correct spawn function based on troopType in temp
# Called at marker position with cityName/teamName/cityDisplayName available
$function mythcraft:respawn/spawn/$(troopType) {cityName:$(cityName), teamName:$(teamName), cityDisplayName:$(cityDisplayName)}
