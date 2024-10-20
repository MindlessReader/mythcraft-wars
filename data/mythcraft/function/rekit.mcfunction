clear @s
item replace entity @s hotbar.0 with iron_sword[enchantments={sharpness:1}]
# sharpness levels here

item replace entity @s hotbar.1 with bow[enchantments={power:1}]
# power levels here

item replace entity @s hotbar.8 with cooked_beef 64
execute if score Amnis cityOwnership matches 1 run item replace entity @s[team=Druids] hotbar.8 with bread[food={nutrition:8,saturation:12.8,eat_seconds:0.865}] 64
execute if score Amnis cityOwnership matches 2 run item replace entity @s[team=Royals] hotbar.8 with bread[food={nutrition:8,saturation:12.8,eat_seconds:0.865}] 64


item replace entity @s inventory.8 with arrow 64

item replace entity @s armor.head with iron_helmet 1 
item replace entity @s armor.chest with iron_chestplate 1
item replace entity @s armor.legs with iron_leggings 1
item replace entity @s armor.feet with iron_boots 1

# apply buffs
function mythcraft:applybuffs

scoreboard players reset @s needsRekit