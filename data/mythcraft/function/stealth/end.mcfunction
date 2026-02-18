# Stealth timer expired — restore armor and item visibility
function mythcraft:stealth/show_armor
# Restore totem model if applicable (assassin with mythcraft totem in offhand)
execute if score @s playerClass matches 2 if items entity @s weapon.offhand totem_of_undying[custom_data~{mythcraft_totem:true}] run item modify entity @s weapon.offhand {function:"minecraft:set_components",components:{"minecraft:item_model":"minecraft:totem_of_undying"}}
scoreboard players reset @s stealthTimer
