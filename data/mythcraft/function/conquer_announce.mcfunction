# Announce city conquest using resolved display names
$title @a[team=!$(teamName)] title [{color:"$(teamColor)",text:"$(teamDisplayName)"},{color:"dark_red",text:" 🗡 "},{text:"$(cityDisplayName)"}]
$title @a[team=$(teamName)] title [{color:"$(teamColor)",text:"$(teamDisplayName)"},{color:"dark_green",text:" ☮ "},{text:"$(cityDisplayName)"}]
$tellraw @a [{color:"#FFD700",text:"The "},{bold:true,color:"$(teamColor)",text:"$(teamDisplayName)"},{color:"#FFD700",text:" have conquered "},{bold:true,text:"$(cityDisplayName)"},{color:"#FFD700",text:"!"}]

$execute if score $(cityId) cityOwnership matches 2 as @s[team=Team1] as @a[team=Team1] run title @p title [{color:"dark_red",text:"Lost $(cityDisplayName)"}]
$execute if score $(cityId) cityOwnership matches 1 as @s[team=Team2] as @a[team=Team2] run title @p title [{color:"dark_red",text:"Lost $(cityDisplayName)"}]
$execute if score $(cityId) cityOwnership matches 2 if score QuestTracker endGame matches 0 as @a[team=Team1] run title @s subtitle {color:"light_purple",text:"Enemy troops in the city will be invulnerable for 1 minute"}
$execute if score $(cityId) cityOwnership matches 1 if score QuestTracker endGame matches 0 as @a[team=Team2] run title @s subtitle {color:"light_purple",text:"Enemy troops in the city will be invulnerable for 1 minute"}
$execute if score $(cityId) cityOwnership matches 2 if score QuestTracker endGame matches 1 as @a[team=Team1] run title @s subtitle {color:"light_purple",text:"Enemy troops in the city can be killed again immediately"}
$execute if score $(cityId) cityOwnership matches 1 if score QuestTracker endGame matches 1 as @a[team=Team2] run title @s subtitle {color:"light_purple",text:"Enemy troops in the city can be killed again immediately"}
