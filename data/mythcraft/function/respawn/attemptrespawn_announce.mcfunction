$tellraw @a [{bold:true,color:"$(teamColor)",text:"$(teamName)"},{color:"#FFD700",text:" troops have regrouped in "},{bold:false,color:"white",text:"$(cityDisplayName)"},{color:"#FFD700",text:"!"}]
$execute if entity @a[tag=debugMode] run say [DEBUG] $(teamName) troops regrouped in $(cityDisplayName)
