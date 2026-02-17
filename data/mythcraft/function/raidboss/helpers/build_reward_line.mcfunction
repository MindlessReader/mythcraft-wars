# Append a reward name to the formatted reward text string
# Params: raidBossRewardsList (current string), rewardName (new reward to add)
# Handles first-item case (no leading newline) vs subsequent items (with newline separator)
$execute unless data storage mythcraft:temp {raidBossRewardsList:""} run data modify storage mythcraft:temp raidBossRewardsList set value "$(raidBossRewardsList)\n- $(rewardName)"
$execute if data storage mythcraft:temp {raidBossRewardsList:""} run data modify storage mythcraft:temp raidBossRewardsList set value "- $(rewardName)"
