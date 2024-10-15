# kill all troops
$execute as @e[type=!marker,tag=$(cityName)] run tp ~ -100 ~
$kill @e[type=!marker,tag=$(cityName)]

$execute at @e[type=marker,tag=$(cityName)] run summon pillager ~ ~ ~ {Glowing:1b,CustomNameVisible:1b,Team:"$(teamName)",NoAI:1b,Health:1f,Tags:["$(cityName)"],CustomName:'"$(cityName) Soldier"'}
#$say spawned $(cityName) $(teamName)