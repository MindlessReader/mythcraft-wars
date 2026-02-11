# Gather quest history data and show the quest history dialog

# Reset trigger
scoreboard players set @s openMenu 0

# Set defaults for all 10 quest slots
data modify storage mythcraft:temp q1 set value "---"
data modify storage mythcraft:temp q2 set value "---"
data modify storage mythcraft:temp q3 set value "---"
data modify storage mythcraft:temp q4 set value "---"
data modify storage mythcraft:temp q5 set value "---"
data modify storage mythcraft:temp q6 set value "---"
data modify storage mythcraft:temp q7 set value "---"
data modify storage mythcraft:temp q8 set value "---"
data modify storage mythcraft:temp q9 set value "---"
data modify storage mythcraft:temp q10 set value "---"

# Override with actual entries (missing indices fail silently, keeping "---")
data modify storage mythcraft:temp q1 set from storage mythcraft:questhistory log[0]
data modify storage mythcraft:temp q2 set from storage mythcraft:questhistory log[1]
data modify storage mythcraft:temp q3 set from storage mythcraft:questhistory log[2]
data modify storage mythcraft:temp q4 set from storage mythcraft:questhistory log[3]
data modify storage mythcraft:temp q5 set from storage mythcraft:questhistory log[4]
data modify storage mythcraft:temp q6 set from storage mythcraft:questhistory log[5]
data modify storage mythcraft:temp q7 set from storage mythcraft:questhistory log[6]
data modify storage mythcraft:temp q8 set from storage mythcraft:questhistory log[7]
data modify storage mythcraft:temp q9 set from storage mythcraft:questhistory log[8]
data modify storage mythcraft:temp q10 set from storage mythcraft:questhistory log[9]

function mythcraft:menu/questhistory_show with storage mythcraft:temp
