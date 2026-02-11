# Assassin class weapons (ID=2)
# Sword: iron → diamond (lvl 3) → netherite (lvl 5)
execute if score @s characterLevel matches ..2 run item replace entity @s hotbar.0 with iron_sword[unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false]
execute if score @s characterLevel matches 3..4 run item replace entity @s hotbar.0 with diamond_sword[unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false]
execute if score @s characterLevel matches 5.. run item replace entity @s hotbar.0 with netherite_sword[unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false]

# Bow, Crossbow, Totem — not iron-based, no tier upgrade
item replace entity @s hotbar.1 with bow[unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false]
item replace entity @s hotbar.2 with crossbow[unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false]
item replace entity @s weapon.offhand with totem_of_undying[enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false]
