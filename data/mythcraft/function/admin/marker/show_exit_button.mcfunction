# Show clickable exit button in chat
# Params: $(locationDisplayName), $(markerLocation)
$tellraw @s ["",{color:"blue",text:"[Marker Helper] Counting markers at "},{color:"gold",bold:true,text:"$(locationDisplayName)"},{color:"blue",text:" ($(markerLocation)). Sidebar updated.\n"},{color:"red",bold:true,text:"[Click to Stop Counting]",clickEvent:{action:"run_command",value:"/trigger adminAction set 20"}}]
