# Report final marker counts
# Params: $(locationDisplayName), $(markerLocation), $(finalRegular), $(finalBoss), $(finalRaidBoss)
$tellraw @s ["",{color:"blue",text:"[Marker Helper] Final counts for "},{color:"gold",bold:true,text:"$(locationDisplayName)"},{color:"blue",text:" ($(markerLocation)):\n"},{color:"green",text:"  Regular: $(finalRegular)\n"},{color:"red",text:"  Boss: $(finalBoss)\n"},{color:"dark_purple",text:"  Raid Boss: $(finalRaidBoss)"}]
