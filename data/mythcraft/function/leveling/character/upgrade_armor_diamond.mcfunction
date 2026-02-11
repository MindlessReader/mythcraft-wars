# In-place armor upgrade: iron → diamond with team trims
# Called with: function ... with storage mythcraft:config teams.TeamN

# Warrior (1) and Bastion (3) have iron head+chest → diamond
$execute unless score @s playerClass matches 2 run item replace entity @s armor.head with diamond_helmet[attribute_modifiers=[],unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false,trim={material:$(trimMaterial),pattern:$(trimPatternHead)}] 1
$execute unless score @s playerClass matches 2 run item replace entity @s armor.chest with diamond_chestplate[attribute_modifiers=[],unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false,trim={material:$(trimMaterial),pattern:$(trimPattern)}] 1

# Bastion only: legs+feet are also iron → diamond
$execute if score @s playerClass matches 3 run item replace entity @s armor.legs with diamond_leggings[attribute_modifiers=[],unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false,trim={material:$(trimMaterial),pattern:$(trimPattern)}] 1
$execute if score @s playerClass matches 3 run item replace entity @s armor.feet with diamond_boots[attribute_modifiers=[],unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false,trim={material:$(trimMaterial),pattern:$(trimPattern)}] 1
