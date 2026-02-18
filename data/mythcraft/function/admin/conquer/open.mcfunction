# Manual conquer: city selection menu
scoreboard players set @s adminAction 0

data modify storage mythcraft:temp city1 set from storage mythcraft:config cities.City1.name
data modify storage mythcraft:temp city2 set from storage mythcraft:config cities.City2.name
data modify storage mythcraft:temp city3 set from storage mythcraft:config cities.City3.name
data modify storage mythcraft:temp city4 set from storage mythcraft:config cities.City4.name
data modify storage mythcraft:temp city5 set from storage mythcraft:config cities.City5.name
data modify storage mythcraft:temp city6 set from storage mythcraft:config cities.City6.name
data modify storage mythcraft:temp city7 set from storage mythcraft:config cities.City7.name

function mythcraft:admin/conquer/show with storage mythcraft:temp
