# Append structured quest result to history array
# Macro params: $(logType), $(logLocation), $(logReward), $(logWinner), $(logWinnerColor)
$data modify storage mythcraft:questhistory log append value {type:"$(logType)",location:"$(logLocation)",reward:"$(logReward)",winner:"$(logWinner)",winnerColor:"$(logWinnerColor)"}
