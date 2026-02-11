# character XP for player kills (worth more than troop kills)
scoreboard players operation @s characterXP += PlayerKill characterXPReward
function mythcraft:leveling/character/checklevel
advancement revoke @s only mythcraft:kill/player
