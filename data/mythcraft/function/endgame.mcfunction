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


#Announce winners
execute if score Druids victoryPoints > Royals victoryPoints run say Druids win! placeholder
execute if score Druids victoryPoints < Royals victoryPoints run say Royals win! placeholder
execute if score Druids victoryPoints = Royals victoryPoints run say you idiots tied, deathmatch time I guess?