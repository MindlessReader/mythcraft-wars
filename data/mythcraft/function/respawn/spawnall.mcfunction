# kill all troops
$execute as @e[type=!marker,tag=$(cityName)] run tp ~ -100 ~
$kill @e[type=!marker,tag=$(cityName)]

# spawn troops based on troop type tag on marker
$execute at @e[type=marker,tag=$(cityName),tag=TestingPillager] run summon pillager ~ ~ ~ {PersistenceRequired:1b,Glowing:1b,CustomNameVisible:1b,Team:"$(teamName)",NoAI:1b,Health:1f,Tags:["$(cityName)"],CustomName:'"$(cityName) Soldier"'}
