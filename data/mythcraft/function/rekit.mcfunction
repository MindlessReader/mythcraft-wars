# rekit
item replace entity @s hotbar.0 with iron_sword[unbreakable={},enchantments={levels:{"minecraft:vanishing_curse":1}}]

item replace entity @s hotbar.1 with bow[unbreakable={},enchantments={levels:{"minecraft:vanishing_curse":1}}]
# power levels here

item replace entity @s hotbar.8 with cooked_beef[enchantments={levels:{"minecraft:vanishing_curse":1}}] 64
execute if score Amnis cityOwnership matches 1 run item replace entity @s[team=Druids] hotbar.8 with bread[food={nutrition:8,saturation:12.8,eat_seconds:0.432},enchantments={levels:{"minecraft:vanishing_curse":1}},item_name='"Nourishing Bread"'] 64
execute if score Amnis cityOwnership matches 2 run item replace entity @s[team=Royals] hotbar.8 with bread[food={nutrition:8,saturation:12.8,eat_seconds:0.865},enchantments={levels:{"minecraft:vanishing_curse":1}},item_name='"Nourishing Bread"'] 64


item replace entity @s inventory.8 with arrow[enchantments={levels:{"minecraft:vanishing_curse":1}}] 64

item replace entity @s armor.head with iron_helmet[unbreakable={},enchantments={levels:{"minecraft:vanishing_curse":1}}] 1 
item replace entity @s armor.chest with iron_chestplate[unbreakable={},enchantments={levels:{"minecraft:vanishing_curse":1}}] 1
item replace entity @s armor.legs with iron_leggings[unbreakable={},enchantments={levels:{"minecraft:vanishing_curse":1}}] 1
item replace entity @s armor.feet with iron_boots[unbreakable={},enchantments={levels:{"minecraft:vanishing_curse":1}}] 1

# apply buffs
function mythcraft:applybuffs

# level equipment
function mythcraft:leveling/levelequipment

scoreboard players reset @s needsRekit