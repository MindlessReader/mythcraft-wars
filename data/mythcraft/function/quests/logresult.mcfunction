# Log the current quest result to mythcraft:questhistory
# Reads quest info from mythcraft:quest storage and winner from QuestTracker

# Copy quest display data
data modify storage mythcraft:temp logType set from storage mythcraft:quest typeText
data modify storage mythcraft:temp logLocation set from storage mythcraft:quest locationText
data modify storage mythcraft:temp logReward set from storage mythcraft:quest rewardText

# Resolve winner name
execute if score QuestTracker questWinner matches 1 run data modify storage mythcraft:temp logWinner set from storage mythcraft:config teams.Team1.name
execute if score QuestTracker questWinner matches 2 run data modify storage mythcraft:temp logWinner set from storage mythcraft:config teams.Team2.name
execute if score QuestTracker questWinner matches 0 run data modify storage mythcraft:temp logWinner set value "Tie"

# Append formatted entry to quest history
function mythcraft:quests/logresult_append with storage mythcraft:temp
