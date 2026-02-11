# In-place upgrade: diamond → netherite (character level 5)

# Weapons: clear old diamond, give netherite
execute if score @s playerClass matches 1..2 run clear @s diamond_sword 1
execute if score @s playerClass matches 1..2 run give @s netherite_sword[unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false] 1

execute if score @s playerClass matches 1 run clear @s diamond_spear 1
execute if score @s playerClass matches 1 run give @s netherite_spear[unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false] 1

execute if score @s playerClass matches 3 run clear @s diamond_axe 1
execute if score @s playerClass matches 3 run give @s netherite_axe[unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false] 1

# Armor: replace in fixed slots (needs team trim macros)
execute as @s[team=Team1] run function mythcraft:leveling/character/upgrade_armor_netherite with storage mythcraft:config teams.Team1
execute as @s[team=Team2] run function mythcraft:leveling/character/upgrade_armor_netherite with storage mythcraft:config teams.Team2
