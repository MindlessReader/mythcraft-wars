# Bastion armor: iron/diamond/netherite with team trim
# All armor has attribute_modifiers=[] to zero vanilla armor — values come from player attributes
# Called with: function mythcraft:rekit/applyarmor with storage mythcraft:config teams.TeamN

# Head: iron → diamond (lvl 3) → netherite (lvl 5)
$execute if score @s characterLevel matches ..2 run item replace entity @s armor.head with iron_helmet[attribute_modifiers=[],unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false,trim={material:$(trimMaterial),pattern:$(trimPatternHead)}] 1
$execute if score @s characterLevel matches 3..4 run item replace entity @s armor.head with diamond_helmet[attribute_modifiers=[],unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false,trim={material:$(trimMaterial),pattern:$(trimPatternHead)}] 1
$execute if score @s characterLevel matches 5.. run item replace entity @s armor.head with netherite_helmet[attribute_modifiers=[],unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false,trim={material:$(trimMaterial),pattern:$(trimPatternHead)}] 1

# Chest: iron → diamond (lvl 3) → netherite (lvl 5)
$execute if score @s characterLevel matches ..2 run item replace entity @s armor.chest with iron_chestplate[attribute_modifiers=[],unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false,trim={material:$(trimMaterial),pattern:$(trimPattern)}] 1
$execute if score @s characterLevel matches 3..4 run item replace entity @s armor.chest with diamond_chestplate[attribute_modifiers=[],unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false,trim={material:$(trimMaterial),pattern:$(trimPattern)}] 1
$execute if score @s characterLevel matches 5.. run item replace entity @s armor.chest with netherite_chestplate[attribute_modifiers=[],unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false,trim={material:$(trimMaterial),pattern:$(trimPattern)}] 1

# Legs: iron → diamond (lvl 3) → netherite (lvl 5)
$execute if score @s characterLevel matches ..2 run item replace entity @s armor.legs with iron_leggings[attribute_modifiers=[],unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false,trim={material:$(trimMaterial),pattern:$(trimPattern)}] 1
$execute if score @s characterLevel matches 3..4 run item replace entity @s armor.legs with diamond_leggings[attribute_modifiers=[],unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false,trim={material:$(trimMaterial),pattern:$(trimPattern)}] 1
$execute if score @s characterLevel matches 5.. run item replace entity @s armor.legs with netherite_leggings[attribute_modifiers=[],unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false,trim={material:$(trimMaterial),pattern:$(trimPattern)}] 1

# Feet: iron → diamond (lvl 3) → netherite (lvl 5)
$execute if score @s characterLevel matches ..2 run item replace entity @s armor.feet with iron_boots[attribute_modifiers=[],unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false,trim={material:$(trimMaterial),pattern:$(trimPattern)}] 1
$execute if score @s characterLevel matches 3..4 run item replace entity @s armor.feet with diamond_boots[attribute_modifiers=[],unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false,trim={material:$(trimMaterial),pattern:$(trimPattern)}] 1
$execute if score @s characterLevel matches 5.. run item replace entity @s armor.feet with netherite_boots[attribute_modifiers=[],unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false,trim={material:$(trimMaterial),pattern:$(trimPattern)}] 1
