# Set max_damage and damage on totem (macro: totemMaxDamage, totemDamage)
$item modify entity @s weapon.offhand {function:"minecraft:set_components",components:{"minecraft:max_damage":$(totemMaxDamage),"minecraft:damage":$(totemDamage)}}
