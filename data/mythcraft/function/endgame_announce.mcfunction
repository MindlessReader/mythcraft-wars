$execute if data storage mythcraft:temp {tiebreakApplied:1} run tellraw @a [{color:"light_purple",text:"Tiebreak: Owners of "},{text:"$(tiebreakCityName)"},{color:"light_purple",text:" granted an additional victory point."}]
$execute if data storage mythcraft:temp {tiebreakApplied:1} if entity @a[tag=debugMode] run say [DEBUG] Tiebreak applied for $(tiebreakCityName)

# update boss bar
execute as @a run bossbar set mythcraft:victorypointsbar players @s
$bossbar set mythcraft:victorypointsbar name [{color:"$(team2Color)",text:"$(team2Name) "},{bold:true,color:"white",score:{name:"Team2",objective:"victoryPoints"}},{bold:false,color:"dark_gray",text:"-"},{bold:true,color:"white",score:{name:"Team1",objective:"victoryPoints"}},{color:"$(team1Color)",text:" $(team1Name)"}]

#Announce winners
$execute if score Team1 victoryPoints > Team2 victoryPoints run title @a title [{bold:true,color:"$(team1Color)",text:"$(team1Name)"},{bold:true,text:" Victory"}]
execute if score Team1 victoryPoints > Team2 victoryPoints run title @a subtitle {color:"light_purple",text:"Winners of Mythcraft Wars"}
$execute if score Team1 victoryPoints > Team2 victoryPoints run tellraw @a [{bold:false,color:"light_purple",text:"The "},{bold:true,color:"$(team1Color)",text:"$(team1Name)"},{bold:false,color:"light_purple",text:" are the winners!"}]
$execute if score Team1 victoryPoints > Team2 victoryPoints if entity @a[tag=debugMode] run say [DEBUG] Winner: $(team1Name)

$execute if score Team1 victoryPoints < Team2 victoryPoints run title @a title [{bold:true,color:"$(team2Color)",text:"$(team2Name)"},{bold:true,text:" Victory"}]
execute if score Team1 victoryPoints < Team2 victoryPoints run title @a subtitle {color:"light_purple",text:"Winners of Mythcraft Wars"}
$execute if score Team1 victoryPoints < Team2 victoryPoints run tellraw @a [{bold:false,color:"light_purple",text:"The "},{bold:true,color:"$(team2Color)",text:"$(team2Name)"},{bold:false,color:"light_purple",text:" are the winners!"}]
$execute if score Team1 victoryPoints < Team2 victoryPoints if entity @a[tag=debugMode] run say [DEBUG] Winner: $(team2Name)

execute as @a at @s run playsound entity.ender_dragon.death master @s ~ ~ ~

execute if score Team1 victoryPoints = Team2 victoryPoints run title @a title {bold:true,color:"light_purple",text:"Draw!"}
execute if score Team1 victoryPoints = Team2 victoryPoints run title @a subtitle {color:"light_purple",text:"Mythcraft Wars ended in a tie"}
execute if score Team1 victoryPoints = Team2 victoryPoints run tellraw @a {bold:true,color:"light_purple",text:"The game ended in a tie!"}
execute if score Team1 victoryPoints = Team2 victoryPoints if entity @a[tag=debugMode] run say [DEBUG] Game ended in a tie