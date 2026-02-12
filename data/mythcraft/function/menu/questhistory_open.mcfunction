# Gather quest history data and show the quest history dialog

# Reset trigger
scoreboard players set @s openMenu 0

# Set defaults for all 10 quest slots (5 fields each)
data modify storage mythcraft:temp q1_type set value "---"
data modify storage mythcraft:temp q1_loc set value "---"
data modify storage mythcraft:temp q1_reward set value "---"
data modify storage mythcraft:temp q1_winner set value "---"
data modify storage mythcraft:temp q1_color set value "gray"

data modify storage mythcraft:temp q2_type set value "---"
data modify storage mythcraft:temp q2_loc set value "---"
data modify storage mythcraft:temp q2_reward set value "---"
data modify storage mythcraft:temp q2_winner set value "---"
data modify storage mythcraft:temp q2_color set value "gray"

data modify storage mythcraft:temp q3_type set value "---"
data modify storage mythcraft:temp q3_loc set value "---"
data modify storage mythcraft:temp q3_reward set value "---"
data modify storage mythcraft:temp q3_winner set value "---"
data modify storage mythcraft:temp q3_color set value "gray"

data modify storage mythcraft:temp q4_type set value "---"
data modify storage mythcraft:temp q4_loc set value "---"
data modify storage mythcraft:temp q4_reward set value "---"
data modify storage mythcraft:temp q4_winner set value "---"
data modify storage mythcraft:temp q4_color set value "gray"

data modify storage mythcraft:temp q5_type set value "---"
data modify storage mythcraft:temp q5_loc set value "---"
data modify storage mythcraft:temp q5_reward set value "---"
data modify storage mythcraft:temp q5_winner set value "---"
data modify storage mythcraft:temp q5_color set value "gray"

data modify storage mythcraft:temp q6_type set value "---"
data modify storage mythcraft:temp q6_loc set value "---"
data modify storage mythcraft:temp q6_reward set value "---"
data modify storage mythcraft:temp q6_winner set value "---"
data modify storage mythcraft:temp q6_color set value "gray"

data modify storage mythcraft:temp q7_type set value "---"
data modify storage mythcraft:temp q7_loc set value "---"
data modify storage mythcraft:temp q7_reward set value "---"
data modify storage mythcraft:temp q7_winner set value "---"
data modify storage mythcraft:temp q7_color set value "gray"

data modify storage mythcraft:temp q8_type set value "---"
data modify storage mythcraft:temp q8_loc set value "---"
data modify storage mythcraft:temp q8_reward set value "---"
data modify storage mythcraft:temp q8_winner set value "---"
data modify storage mythcraft:temp q8_color set value "gray"

data modify storage mythcraft:temp q9_type set value "---"
data modify storage mythcraft:temp q9_loc set value "---"
data modify storage mythcraft:temp q9_reward set value "---"
data modify storage mythcraft:temp q9_winner set value "---"
data modify storage mythcraft:temp q9_color set value "gray"

data modify storage mythcraft:temp q10_type set value "---"
data modify storage mythcraft:temp q10_loc set value "---"
data modify storage mythcraft:temp q10_reward set value "---"
data modify storage mythcraft:temp q10_winner set value "---"
data modify storage mythcraft:temp q10_color set value "gray"

# Override with actual entries (missing indices fail silently, keeping defaults)
data modify storage mythcraft:temp q1_type set from storage mythcraft:questhistory log[0].type
data modify storage mythcraft:temp q1_loc set from storage mythcraft:questhistory log[0].location
data modify storage mythcraft:temp q1_reward set from storage mythcraft:questhistory log[0].reward
data modify storage mythcraft:temp q1_winner set from storage mythcraft:questhistory log[0].winner
data modify storage mythcraft:temp q1_color set from storage mythcraft:questhistory log[0].winnerColor

data modify storage mythcraft:temp q2_type set from storage mythcraft:questhistory log[1].type
data modify storage mythcraft:temp q2_loc set from storage mythcraft:questhistory log[1].location
data modify storage mythcraft:temp q2_reward set from storage mythcraft:questhistory log[1].reward
data modify storage mythcraft:temp q2_winner set from storage mythcraft:questhistory log[1].winner
data modify storage mythcraft:temp q2_color set from storage mythcraft:questhistory log[1].winnerColor

data modify storage mythcraft:temp q3_type set from storage mythcraft:questhistory log[2].type
data modify storage mythcraft:temp q3_loc set from storage mythcraft:questhistory log[2].location
data modify storage mythcraft:temp q3_reward set from storage mythcraft:questhistory log[2].reward
data modify storage mythcraft:temp q3_winner set from storage mythcraft:questhistory log[2].winner
data modify storage mythcraft:temp q3_color set from storage mythcraft:questhistory log[2].winnerColor

data modify storage mythcraft:temp q4_type set from storage mythcraft:questhistory log[3].type
data modify storage mythcraft:temp q4_loc set from storage mythcraft:questhistory log[3].location
data modify storage mythcraft:temp q4_reward set from storage mythcraft:questhistory log[3].reward
data modify storage mythcraft:temp q4_winner set from storage mythcraft:questhistory log[3].winner
data modify storage mythcraft:temp q4_color set from storage mythcraft:questhistory log[3].winnerColor

data modify storage mythcraft:temp q5_type set from storage mythcraft:questhistory log[4].type
data modify storage mythcraft:temp q5_loc set from storage mythcraft:questhistory log[4].location
data modify storage mythcraft:temp q5_reward set from storage mythcraft:questhistory log[4].reward
data modify storage mythcraft:temp q5_winner set from storage mythcraft:questhistory log[4].winner
data modify storage mythcraft:temp q5_color set from storage mythcraft:questhistory log[4].winnerColor

data modify storage mythcraft:temp q6_type set from storage mythcraft:questhistory log[5].type
data modify storage mythcraft:temp q6_loc set from storage mythcraft:questhistory log[5].location
data modify storage mythcraft:temp q6_reward set from storage mythcraft:questhistory log[5].reward
data modify storage mythcraft:temp q6_winner set from storage mythcraft:questhistory log[5].winner
data modify storage mythcraft:temp q6_color set from storage mythcraft:questhistory log[5].winnerColor

data modify storage mythcraft:temp q7_type set from storage mythcraft:questhistory log[6].type
data modify storage mythcraft:temp q7_loc set from storage mythcraft:questhistory log[6].location
data modify storage mythcraft:temp q7_reward set from storage mythcraft:questhistory log[6].reward
data modify storage mythcraft:temp q7_winner set from storage mythcraft:questhistory log[6].winner
data modify storage mythcraft:temp q7_color set from storage mythcraft:questhistory log[6].winnerColor

data modify storage mythcraft:temp q8_type set from storage mythcraft:questhistory log[7].type
data modify storage mythcraft:temp q8_loc set from storage mythcraft:questhistory log[7].location
data modify storage mythcraft:temp q8_reward set from storage mythcraft:questhistory log[7].reward
data modify storage mythcraft:temp q8_winner set from storage mythcraft:questhistory log[7].winner
data modify storage mythcraft:temp q8_color set from storage mythcraft:questhistory log[7].winnerColor

data modify storage mythcraft:temp q9_type set from storage mythcraft:questhistory log[8].type
data modify storage mythcraft:temp q9_loc set from storage mythcraft:questhistory log[8].location
data modify storage mythcraft:temp q9_reward set from storage mythcraft:questhistory log[8].reward
data modify storage mythcraft:temp q9_winner set from storage mythcraft:questhistory log[8].winner
data modify storage mythcraft:temp q9_color set from storage mythcraft:questhistory log[8].winnerColor

data modify storage mythcraft:temp q10_type set from storage mythcraft:questhistory log[9].type
data modify storage mythcraft:temp q10_loc set from storage mythcraft:questhistory log[9].location
data modify storage mythcraft:temp q10_reward set from storage mythcraft:questhistory log[9].reward
data modify storage mythcraft:temp q10_winner set from storage mythcraft:questhistory log[9].winner
data modify storage mythcraft:temp q10_color set from storage mythcraft:questhistory log[9].winnerColor

function mythcraft:menu/questhistory_show with storage mythcraft:temp
