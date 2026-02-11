# Warrior armor: iron/diamond/netherite head+chest, leather legs+boots with team trim
# All armor has attribute_modifiers=[] to zero vanilla armor — values come from player attributes
# Called with: function mythcraft:rekit/armor_warrior with storage mythcraft:config teams.TeamN

# Head: iron → diamond (lvl 3) → netherite (lvl 5)
$execute if score @s characterLevel matches ..2 run item replace entity @s armor.head with iron_helmet[attribute_modifiers=[],unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false,trim={material:$(trimMaterial),pattern:$(trimPatternHead)}] 1
$execute if score @s characterLevel matches 3..4 run item replace entity @s armor.head with diamond_helmet[attribute_modifiers=[],unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false,trim={material:$(trimMaterial),pattern:$(trimPatternHead)}] 1
$execute if score @s characterLevel matches 5.. run item replace entity @s armor.head with netherite_helmet[attribute_modifiers=[],unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false,trim={material:$(trimMaterial),pattern:$(trimPatternHead)}] 1

# Chest: iron → diamond (lvl 3) → netherite (lvl 5)
$execute if score @s characterLevel matches ..2 run item replace entity @s armor.chest with iron_chestplate[attribute_modifiers=[],unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false,trim={material:$(trimMaterial),pattern:$(trimPattern)}] 1
$execute if score @s characterLevel matches 3..4 run item replace entity @s armor.chest with diamond_chestplate[attribute_modifiers=[],unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false,trim={material:$(trimMaterial),pattern:$(trimPattern)}] 1
$execute if score @s characterLevel matches 5.. run item replace entity @s armor.chest with netherite_chestplate[attribute_modifiers=[],unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false,trim={material:$(trimMaterial),pattern:$(trimPattern)}] 1

# Legs + Feet: leather at all levels
$item replace entity @s armor.legs with leather_leggings[attribute_modifiers=[],unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false,trim={material:$(trimMaterial),pattern:$(trimPattern)}] 1
$item replace entity @s armor.feet with leather_boots[attribute_modifiers=[],unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false,trim={material:$(trimMaterial),pattern:$(trimPattern)}] 1
