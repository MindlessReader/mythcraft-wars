# Applies team-colored armor with trim from config
# Called with: function mythcraft:rekit/applyarmor with storage mythcraft:config teams.TeamN
$item replace entity @s armor.head with iron_helmet[unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false,trim={material:$(trimMaterial),pattern:$(trimPatternHead)}] 1
$item replace entity @s armor.chest with iron_chestplate[unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false,trim={material:$(trimMaterial),pattern:$(trimPattern)}] 1
$item replace entity @s armor.legs with iron_leggings[unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false,trim={material:$(trimMaterial),pattern:$(trimPattern)}] 1
$item replace entity @s armor.feet with iron_boots[unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false,trim={material:$(trimMaterial),pattern:$(trimPattern)}] 1
