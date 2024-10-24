execute if score Celak cityOwnership matches 1 run scoreboard players add Druids victoryPoints 2
execute if score Kings-Port cityOwnership matches 1 run scoreboard players add Druids victoryPoints 2
execute if score Athens cityOwnership matches 1 run scoreboard players add Druids victoryPoints 1
execute if score Delphi cityOwnership matches 1 run scoreboard players add Druids victoryPoints 1
execute if score Povertane cityOwnership matches 1 run scoreboard players add Druids victoryPoints 1
execute if score Amnis cityOwnership matches 1 run scoreboard players add Druids victoryPoints 1
execute if score Fronteria cityOwnership matches 1 run scoreboard players add Druids victoryPoints 1

execute if score Celak cityOwnership matches 2 run scoreboard players add Royals victoryPoints 2
execute if score Kings-Port cityOwnership matches 2 run scoreboard players add Royals victoryPoints 2
execute if score Athens cityOwnership matches 2 run scoreboard players add Royals victoryPoints 1
execute if score Delphi cityOwnership matches 2 run scoreboard players add Royals victoryPoints 1
execute if score Povertane cityOwnership matches 2 run scoreboard players add Royals victoryPoints 1
execute if score Amnis cityOwnership matches 2 run scoreboard players add Royals victoryPoints 1
execute if score Fronteria cityOwnership matches 2 run scoreboard players add Royals victoryPoints 1

execute if score Druids victoryPoints = Royals victoryPoints if score Athens cityOwnership matches 1 run scoreboard players add Druids victoryPoints 1
execute if score Druids victoryPoints = Royals victoryPoints if score Athens cityOwnership matches 2 run scoreboard players add Druids victoryPoints 1
execute if score Druids victoryPoints = Royals victoryPoints run tellraw @a [{"color":"#663399","text":"Tiebreak: Owners of Athens granted an additonal victory point."}]

# update boss bar
execute as @a run bossbar set mythcraft:victorypointsbar players @s
bossbar set mythcraft:victorypointsbar name [{"bold":false,"color":"blue","text":"Royals "},{"bold":true,"color":"white","score":{"name":"Royals","objective":"victoryPoints"}},{"bold":false,"color":"dark_gray","text":"-"},{"bold":true,"color":"white","score":{"name":"Druids","objective":"victoryPoints"}},{"bold":false,"color":"green","text":" Druids"}]


#Announce winners
execute if score Druids victoryPoints > Royals victoryPoints run title @a title {"bold":true,"color":"green","text":"Druid Victory"}
execute if score Druids victoryPoints > Royals victoryPoints run title @a subtitle {"color":"#663399","text":"Winners of the Mythcraft 10 Year Anniversary Event"}
execute if score Druids victoryPoints > Royals victoryPoints run tellraw @a [{"bold":false,"color":"#663399","text":"The "},{"bold":true,"color":"green","text":"Druids"},{"bold":false,"color":"#663399","text":" are the winners of the MythCraft 10 Year Anniversary Event!"}]

execute if score Druids victoryPoints < Royals victoryPoints run title @a title {"bold":true,"color":"blue","text":"Royal Victory"}
execute if score Druids victoryPoints < Royals victoryPoints run title @a subtitle {"color":"#663399","text":"Winners of the Mythcraft 10 Year Anniversary Event"}
execute if score Druids victoryPoints < Royals victoryPoints run tellraw @a [{"bold":false,"color":"#663399","text":"The "},{"bold":true,"color":"blue","text":"Royals"},{"bold":false,"color":"#663399","text":" are the winners of the MythCraft 10 Year Anniversary Event!"}]

execute as @a at @s run playsound entity.ender_dragon.death master @s ~ ~ ~

execute if score Druids victoryPoints = Royals victoryPoints run say you idiots still tied even with the athens tiebreaker, deathmatch time I guess?