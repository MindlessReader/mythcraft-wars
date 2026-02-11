# Append formatted quest result string to history array
# Macro params: $(logType), $(logLocation), $(logReward), $(logWinner)
$data modify storage mythcraft:questhistory log append value "$(logType): $(logLocation) | $(logReward) | Winner: $(logWinner)"
