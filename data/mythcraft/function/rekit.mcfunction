# clear items
clear @s

# rekit
item replace entity @s hotbar.0 with iron_sword[unbreakable={},enchantments={levels:{"minecraft:vanishing_curse":1}}]
item replace entity @s hotbar.1 with bow[unbreakable={},enchantments={levels:{"minecraft:vanishing_curse":1}}]
item replace entity @s hotbar.8 with cooked_beef[enchantments={levels:{"minecraft:vanishing_curse":1}}] 64
item replace entity @s inventory.8 with arrow[enchantments={levels:{"minecraft:vanishing_curse":1}}] 64
item replace entity @s[team=Druids] armor.head with iron_helmet[unbreakable={},enchantments={levels:{"minecraft:vanishing_curse":1}},trim={material:emerald,pattern:wild}] 1 
item replace entity @s[team=Druids] armor.chest with iron_chestplate[unbreakable={},enchantments={levels:{"minecraft:vanishing_curse":1}},trim={material:emerald,pattern:wild}] 1
item replace entity @s[team=Druids] armor.legs with iron_leggings[unbreakable={},enchantments={levels:{"minecraft:vanishing_curse":1}},trim={material:emerald,pattern:wild}] 1
item replace entity @s[team=Druids] armor.feet with iron_boots[unbreakable={},enchantments={levels:{"minecraft:vanishing_curse":1}},trim={material:emerald,pattern:wild}] 1
item replace entity @s[team=Royals] armor.head with iron_helmet[unbreakable={},enchantments={levels:{"minecraft:vanishing_curse":1}},trim={material:lapis,pattern:sentry}] 1 
item replace entity @s[team=Royals] armor.chest with iron_chestplate[unbreakable={},enchantments={levels:{"minecraft:vanishing_curse":1}},trim={material:lapis,pattern:sentry}] 1
item replace entity @s[team=Royals] armor.legs with iron_leggings[unbreakable={},enchantments={levels:{"minecraft:vanishing_curse":1}},trim={material:lapis,pattern:sentry}] 1
item replace entity @s[team=Royals] armor.feet with iron_boots[unbreakable={},enchantments={levels:{"minecraft:vanishing_curse":1}},trim={material:lapis,pattern:sentry}] 1

# shield if appropriate level
execute as @s[team=Druids] run scoreboard players operation @s levelFort-Reference = Druids levelFort-Reference
execute as @s[team=Royals] run scoreboard players operation @s levelFort-Reference = Royals levelFort-Reference
item replace entity @s[scores={levelFort-Reference=1..}] weapon.offhand with shield[unbreakable={},enchantments={levels:{"minecraft:vanishing_curse":1}}] 1

# city benefits (/items at top to make sure nothing is overwritten)
execute if score Amnis cityOwnership matches 1 run item replace entity @s[team=Druids] hotbar.8 with bread[food={nutrition:8,saturation:12.8,eat_seconds:0.432},enchantments={levels:{"minecraft:vanishing_curse":1}},item_name='"Nourishing Bread"'] 64
execute if score Amnis cityOwnership matches 2 run item replace entity @s[team=Royals] hotbar.8 with bread[food={nutrition:8,saturation:12.8,eat_seconds:0.432},enchantments={levels:{"minecraft:vanishing_curse":1}},item_name='"Nourishing Bread"'] 64

# Thoth University Spell (had to put this in the middle of the city benefits since its a /give)
execute as @s[team=Druids] run scoreboard players operation @s levelThoth-University = Druids levelThoth-University
execute as @s[team=Royals] run scoreboard players operation @s levelThoth-University = Royals levelThoth-University
scoreboard players set @s SpellBreathCooldown 0
give @s[scores={levelThoth-University=1..5}] dragon_breath[enchantments={levels:{"minecraft:vanishing_curse":1}},max_stack_size=1,custom_name='[{"color":"light_purple","italic":false,"text":"Seeking Breath"},{"color":"white","italic":false,"text":" [Cold]"}]',lore=['{"color":"gray","italic":false,"text":"Cooldown: 30s","underlined":true}'],hide_additional_tooltip={},custom_data={mythcraft_breathspell:1b},food={nutrition:0,saturation:0,can_always_eat:true}] 1
#


execute if score Athens cityOwnership matches 1 as @s[team=Druids] run function mythcraft:kill/giveequipment/athens
execute if score Athens cityOwnership matches 2 as @s[team=Royals] run function mythcraft:kill/giveequipment/athens

execute if score Kings-Port cityOwnership matches 1 as @s[team=Druids] run function mythcraft:kill/giveequipment/kings-port
execute if score Kings-Port cityOwnership matches 2 as @s[team=Royals] run function mythcraft:kill/giveequipment/kings-port

execute if score Celak cityOwnership matches 1 as @s[team=Druids] run function mythcraft:kill/giveequipment/celak
execute if score Celak cityOwnership matches 2 as @s[team=Royals] run function mythcraft:kill/giveequipment/celak

execute if score Povertane cityOwnership matches 1 as @s[team=Druids] run function mythcraft:kill/giveequipment/povertane
execute if score Povertane cityOwnership matches 2 as @s[team=Royals] run function mythcraft:kill/giveequipment/povertane

execute if score Fronteria cityOwnership matches 1 as @s[team=Druids] run function mythcraft:kill/giveequipment/fronteria
execute if score Fronteria cityOwnership matches 2 as @s[team=Royals] run function mythcraft:kill/giveequipment/fronteria

execute if score Delphi cityOwnership matches 1 as @s[team=Druids] run function mythcraft:kill/giveequipment/delphi
execute if score Delphi cityOwnership matches 2 as @s[team=Royals] run function mythcraft:kill/giveequipment/delphi

# apply buffs
function mythcraft:applybuffs

# level equipment
function mythcraft:leveling/levelequipment

scoreboard players reset @s needsRekit