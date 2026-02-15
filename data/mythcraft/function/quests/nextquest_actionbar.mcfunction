# Display countdown in action bar, rescheduling every 2s
# Shows "Next Quest" if more quests remain, "Endgame begins" if this was the last quest

# Next Quest variant (questsRemaining >= 1)
execute if score QuestTracker questsRemaining matches 1.. if score QuestTracker questTimerSec matches 10.. run title @a actionbar [{color:"white",text:"Next Quest "},{color:"yellow",text:"["},{color:"yellow",score:{name:"QuestTracker",objective:"questTimerMin"}},{color:"yellow",text:":"},{color:"yellow",score:{name:"QuestTracker",objective:"questTimerSec"}},{color:"yellow",text:"]"}]
execute if score QuestTracker questsRemaining matches 1.. if score QuestTracker questTimerSec matches ..9 run title @a actionbar [{color:"white",text:"Next Quest "},{color:"yellow",text:"["},{color:"yellow",score:{name:"QuestTracker",objective:"questTimerMin"}},{color:"yellow",text:":0"},{color:"yellow",score:{name:"QuestTracker",objective:"questTimerSec"}},{color:"yellow",text:"]"}]

# Endgame variant (questsRemaining = 0)
execute if score QuestTracker questsRemaining matches ..0 if score QuestTracker questTimerSec matches 10.. run title @a actionbar [{color:"white",text:"Endgame begins "},{color:"yellow",text:"["},{color:"yellow",score:{name:"QuestTracker",objective:"questTimerMin"}},{color:"yellow",text:":"},{color:"yellow",score:{name:"QuestTracker",objective:"questTimerSec"}},{color:"yellow",text:"]"}]
execute if score QuestTracker questsRemaining matches ..0 if score QuestTracker questTimerSec matches ..9 run title @a actionbar [{color:"white",text:"Endgame begins "},{color:"yellow",text:"["},{color:"yellow",score:{name:"QuestTracker",objective:"questTimerMin"}},{color:"yellow",text:":0"},{color:"yellow",score:{name:"QuestTracker",objective:"questTimerSec"}},{color:"yellow",text:"]"}]

# Reschedule
schedule function mythcraft:quests/nextquest_actionbar 2s
