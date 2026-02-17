# Lookup display name for a reward ID
# Params: $(rewardId) — the reward string ID
# Sets mythcraft:quest rewardText to the display name

$data modify storage mythcraft:quest rewardText set from storage mythcraft:rewards $(rewardId)
