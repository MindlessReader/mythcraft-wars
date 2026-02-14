# character XP for player kills (worth more than troop kills)
scoreboard players operation @s characterXP += PlayerKill characterXPReward
function mythcraft:leveling/character/checklevel
# assassin totem charge (+3 for player kills)
execute if score @s playerClass matches 2 run function mythcraft:totem/charge {amount:3}
advancement revoke @s only mythcraft:kill/player
