# Display endgame countdown in action bar, rescheduling every 2s

# Two variants for zero-padding the seconds display
execute if score QuestTracker questTimerSec matches 10.. run title @a actionbar ["",{bold:true,color:"#663399",text:"☠ Endgame ☠ "},{color:"yellow",text:"["},{color:"yellow",score:{name:"QuestTracker",objective:"questTimerMin"}},{color:"yellow",text:":"},{color:"yellow",score:{name:"QuestTracker",objective:"questTimerSec"}},{color:"yellow",text:"]"}]

execute if score QuestTracker questTimerSec matches ..9 run title @a actionbar ["",{bold:true,color:"#663399",text:"☠ Endgame ☠ "},{color:"yellow",text:"["},{color:"yellow",score:{name:"QuestTracker",objective:"questTimerMin"}},{color:"yellow",text:":0"},{color:"yellow",score:{name:"QuestTracker",objective:"questTimerSec"}},{color:"yellow",text:"]"}]

# Reschedule
schedule function mythcraft:endgame_actionbar 2s
