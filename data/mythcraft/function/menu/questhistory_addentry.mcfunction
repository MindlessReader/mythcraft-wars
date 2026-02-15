# Append one formatted quest history entry to historyBody
# Params: entryNum, entryType, entryLoc, entryReward, entryWinner, entryColor
$data modify storage mythcraft:temp historyBody append value {text:"$(entryNum). ",bold:true}
$data modify storage mythcraft:temp historyBody append value {text:"$(entryType): "}
$data modify storage mythcraft:temp historyBody append value {text:"$(entryLoc)\n",color:"red"}
data modify storage mythcraft:temp historyBody append value {text:"    Reward: ",color:"light_purple"}
$data modify storage mythcraft:temp historyBody append value {text:"$(entryReward)\n",color:"light_purple"}
$data modify storage mythcraft:temp historyBody append value {text:"    Winner: ",color:"$(entryColor)"}
$data modify storage mythcraft:temp historyBody append value {text:"$(entryWinner)\n\n",color:"$(entryColor)"}
