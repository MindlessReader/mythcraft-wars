# Display quest info + timer in action bar, rescheduling every 2s while quest is active

# Two variants for zero-padding the seconds display
execute if score QuestTracker questWinner matches 0 if score QuestTracker questTimerSec matches 10.. run title @a actionbar [{color:"white",nbt:"typeText",storage:"mythcraft:quest"},{color:"white",text:": "},{color:"red",nbt:"locationText",storage:"mythcraft:quest"},{color:"white",text:" ("},{color:"light_purple",nbt:"rewardText",storage:"mythcraft:quest"},{text:") "},{color:"yellow",text:"["},{color:"yellow",score:{name:"QuestTracker",objective:"questTimerMin"}},{color:"yellow",text:":"},{color:"yellow",score:{name:"QuestTracker",objective:"questTimerSec"}},{color:"yellow",text:"]"}]

execute if score QuestTracker questWinner matches 0 if score QuestTracker questTimerSec matches ..9 run title @a actionbar [{color:"white",nbt:"typeText",storage:"mythcraft:quest"},{color:"white",text:": "},{color:"red",nbt:"locationText",storage:"mythcraft:quest"},{color:"white",text:" ("},{color:"light_purple",nbt:"rewardText",storage:"mythcraft:quest"},{text:") "},{color:"yellow",text:"["},{color:"yellow",score:{name:"QuestTracker",objective:"questTimerMin"}},{color:"yellow",text:":0"},{color:"yellow",score:{name:"QuestTracker",objective:"questTimerSec"}},{color:"yellow",text:"]"}]

# Only reschedule if quest is still active
execute if score QuestTracker questWinner matches 0 run schedule function mythcraft:quests/actionbar 2s
