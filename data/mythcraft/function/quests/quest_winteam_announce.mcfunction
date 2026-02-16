$tellraw @a [{bold:true,color:"light_purple",text:"Quest End: "},{bold:true,color:"$(teamColor)",text:"$(teamDisplayName)"},{color:"white",text:" won the quest!"}]
$execute if entity @a[tag=debugMode] run say [DEBUG] Quest won by $(teamDisplayName)
