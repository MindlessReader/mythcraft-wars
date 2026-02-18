# Count markers at the configured location
# Params: $(markerLocation)
$execute store result score Regular markerCount if entity @e[type=marker,tag=spawnmarker_regular,tag=$(markerLocation)]
$execute store result score Boss markerCount if entity @e[type=marker,tag=spawnmarker_boss,tag=$(markerLocation)]
$execute store result score RaidBoss markerCount if entity @e[type=marker,tag=spawnmarker_raidboss,tag=$(markerLocation)]
