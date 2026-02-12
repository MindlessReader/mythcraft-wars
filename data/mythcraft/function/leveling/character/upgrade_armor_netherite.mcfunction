# In-place armor upgrade: diamond → netherite with team trims
# Called with: function ... with storage mythcraft:config teams.TeamN

# Warrior (1), Assassin (2), and Bastion (3) have diamond head → netherite; Warrior/Bastion chest too
$item replace entity @s armor.head with netherite_helmet[attribute_modifiers=[],unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false,trim={material:$(trimMaterial),pattern:$(trimPatternHead)}] 1
$execute unless score @s playerClass matches 2 run item replace entity @s armor.chest with netherite_chestplate[attribute_modifiers=[],unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false,trim={material:$(trimMaterial),pattern:$(trimPattern)}] 1

# Bastion only: legs+feet are also diamond → netherite
$execute if score @s playerClass matches 3 run item replace entity @s armor.legs with netherite_leggings[attribute_modifiers=[],unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false,trim={material:$(trimMaterial),pattern:$(trimPattern)}] 1
$execute if score @s playerClass matches 3 run item replace entity @s armor.feet with netherite_boots[attribute_modifiers=[],unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false,trim={material:$(trimMaterial),pattern:$(trimPattern)}] 1
