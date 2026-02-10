# resolve team display names
data modify storage mythcraft:temp team1Name set from storage mythcraft:config teams.Team1.name
data modify storage mythcraft:temp team1Color set from storage mythcraft:config teams.Team1.color
data modify storage mythcraft:temp team2Name set from storage mythcraft:config teams.Team2.name
data modify storage mythcraft:temp team2Color set from storage mythcraft:config teams.Team2.color

# text if Team1 owns city (Team1 defends, Team2 attacks)
execute if score QuestTracker questLocationOwner matches 1 run data modify storage mythcraft:temp defenderName set from storage mythcraft:temp team1Name
execute if score QuestTracker questLocationOwner matches 1 run data modify storage mythcraft:temp defenderColor set from storage mythcraft:temp team1Color
execute if score QuestTracker questLocationOwner matches 1 run data modify storage mythcraft:temp attackerName set from storage mythcraft:temp team2Name
execute if score QuestTracker questLocationOwner matches 1 run data modify storage mythcraft:temp attackerColor set from storage mythcraft:temp team2Color
execute if score QuestTracker questLocationOwner matches 1 run function mythcraft:quests/announce/conquerquest_owned with storage mythcraft:temp

# text if Team2 owns city (Team2 defends, Team1 attacks)
execute if score QuestTracker questLocationOwner matches 2 run data modify storage mythcraft:temp defenderName set from storage mythcraft:temp team2Name
execute if score QuestTracker questLocationOwner matches 2 run data modify storage mythcraft:temp defenderColor set from storage mythcraft:temp team2Color
execute if score QuestTracker questLocationOwner matches 2 run data modify storage mythcraft:temp attackerName set from storage mythcraft:temp team1Name
execute if score QuestTracker questLocationOwner matches 2 run data modify storage mythcraft:temp attackerColor set from storage mythcraft:temp team1Color
execute if score QuestTracker questLocationOwner matches 2 run function mythcraft:quests/announce/conquerquest_owned with storage mythcraft:temp

# text if city is unclaimed
execute if score QuestTracker questLocationOwner matches 0 run tellraw @a "The first team to conquer this city within the next 5 minutes wins the reward!"
