# Load one quest history entry by index and append to historyBody
# Params: $(loopIndex) (0-based), $(loopNum) (1-based display number)

# Set defaults (overridden below if log entry exists)
$data modify storage mythcraft:temp entryNum set value $(loopNum)
data modify storage mythcraft:temp entryType set value "---"
data modify storage mythcraft:temp entryLoc set value "---"
data modify storage mythcraft:temp entryReward set value "---"
data modify storage mythcraft:temp entryWinner set value "---"
data modify storage mythcraft:temp entryColor set value "gray"

# Override from log (silently fails if index doesn't exist yet)
$data modify storage mythcraft:temp entryType set from storage mythcraft:questhistory log[$(loopIndex)].type
$data modify storage mythcraft:temp entryLoc set from storage mythcraft:questhistory log[$(loopIndex)].location
$data modify storage mythcraft:temp entryReward set from storage mythcraft:questhistory log[$(loopIndex)].reward
$data modify storage mythcraft:temp entryWinner set from storage mythcraft:questhistory log[$(loopIndex)].winner
$data modify storage mythcraft:temp entryColor set from storage mythcraft:questhistory log[$(loopIndex)].winnerColor

function mythcraft:menu/questhistory_addentry with storage mythcraft:temp
