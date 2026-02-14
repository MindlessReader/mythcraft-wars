# Character level-up effects — no full rekit, upgrade in-place
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1
title @s actionbar [{text:"Character Level Up!",color:"gold"}]

# Update armor/toughness attributes based on class + level
function mythcraft:leveling/character/setattributes

# At gear tier breakpoints: upgrade items in-place
execute if score @s characterLevel matches 3 run function mythcraft:leveling/character/upgradetier3
execute if score @s characterLevel matches 5 run function mythcraft:leveling/character/upgradetier5

# Re-apply enchantments (characterLevel changed → new enchant levels)
function mythcraft:leveling/levelequipment

# Update assassin totem (max charge changes with level)
execute if score @s playerClass matches 2 run function mythcraft:totem/update
