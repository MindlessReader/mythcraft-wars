# text if druids own city
execute if score QuestTracker questLocationOwner matches 1 run tellraw @a [{"color":"green","text":"Druids"}, {"color":"white","text":" must defend their claim for 5 minutes to win the reward!"}]
execute if score QuestTracker questLocationOwner matches 1 run tellraw @a [{"color":"blue","text":"Royals"}, {"color":"white","text":" must conquer the city before 5 minutes have passed to win the reward!"}]

# text if royals own city
execute if score QuestTracker questLocationOwner matches 2 run tellraw @a [{"color":"blue","text":"Royals"}, {"color":"white","text":" must defend their claim for 5 minutes to win the reward!"}]
execute if score QuestTracker questLocationOwner matches 2 run tellraw @a [{"color":"green","text":"Druids"}, {"color":"white","text":" must conquer the city before 5 minutes have passed to win the reward!"}]

# text if city is unclaimed
execute if score QuestTracker questLocationOwner matches 0 run tellraw @a "The first team to conquer this city within the next 5 minutes wins the reward!"