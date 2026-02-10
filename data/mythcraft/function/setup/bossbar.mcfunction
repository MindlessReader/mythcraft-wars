# Sets the bossbar name using resolved team display names
$bossbar set mythcraft:victorypointsbar name [{color:"$(team2Color)",text:"$(team2Name) "},{bold:true,color:"white",score:{name:"Team2",objective:"victoryPoints"}},{bold:false,color:"dark_gray",text:"-"},{bold:true,color:"white",score:{name:"Team1",objective:"victoryPoints"}},{color:"$(team1Color)",text:" $(team1Name)"}]
