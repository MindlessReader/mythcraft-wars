# Stealth timer expired — restore armor and totem visibility
function mythcraft:totem/show_armor
item modify entity @s weapon.offhand {function:"minecraft:set_components",components:{"minecraft:item_model":"minecraft:totem_of_undying"}}
scoreboard players reset @s totemInvisTimer
