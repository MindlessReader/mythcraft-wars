# announce level up with resolved team display names
$execute as @s[team=Team1] run tellraw @a [{color:"$(team1Color)",text:"$(team1Name)"},{color:"#FFD700",text:" have leveled up the "},{bold:false,color:"white",text:"$(locationName)"},{color:"#FFD700",text:" skill to level "},{color:"light_purple",score:{name:"Team1",objective:"level$(locationName)"}},{color:"#FFD700",text:" ⚡"}]
$execute as @s[team=Team2] run tellraw @a [{color:"$(team2Color)",text:"$(team2Name)"},{color:"#FFD700",text:" have leveled up the "},{bold:false,color:"white",text:"$(locationName)"},{color:"#FFD700",text:" skill to level "},{color:"light_purple",score:{name:"Team2",objective:"level$(locationName)"}},{color:"#FFD700",text:" ⚡"}]
$execute as @s[team=Team1] if entity @a[tag=debugMode] run say [DEBUG] $(team1Name) leveled up $(locationName)
$execute as @s[team=Team2] if entity @a[tag=debugMode] run say [DEBUG] $(team2Name) leveled up $(locationName)
