# Assassin class weapons (ID=2)
# Sword: iron → diamond (lvl 3) → netherite (lvl 5)
execute if score @s characterLevel matches ..2 run item replace entity @s hotbar.0 with iron_sword[unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false]
execute if score @s characterLevel matches 3..4 run item replace entity @s hotbar.0 with diamond_sword[unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false]
execute if score @s characterLevel matches 5.. run item replace entity @s hotbar.0 with netherite_sword[unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false]

# Bow, Crossbow — not iron-based, no tier upgrade
item replace entity @s hotbar.1 with bow[unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false]
item replace entity @s hotbar.2 with crossbow[unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false]

# Chargeable totem — starts empty, charge from scoreboard synced by totem/update
item replace entity @s weapon.offhand with totem_of_undying[enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false,custom_data={mythcraft_totem:true},max_damage=64,damage=64,food={nutrition:0,saturation:0,can_always_eat:true},consumable={consume_seconds:100,animation:"none",sound:"minecraft:intentionally_empty",has_consume_particles:false},tooltip_display={hidden_components:["minecraft:food","minecraft:consumable","minecraft:enchantments"]}]
function mythcraft:totem/update
scoreboard players set @s totemCooldown 40
