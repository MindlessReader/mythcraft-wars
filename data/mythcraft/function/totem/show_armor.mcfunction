# Restore armor visibility by setting equippable asset_id back to correct material
# Head depends on character level (iron/diamond/netherite); body is always leather
execute if score @s characterLevel matches ..2 run item modify entity @s armor.head {function:"minecraft:set_components",components:{"minecraft:equippable":{"slot":"head","asset_id":"minecraft:iron"}}}
execute if score @s characterLevel matches 3..4 run item modify entity @s armor.head {function:"minecraft:set_components",components:{"minecraft:equippable":{"slot":"head","asset_id":"minecraft:diamond"}}}
execute if score @s characterLevel matches 5.. run item modify entity @s armor.head {function:"minecraft:set_components",components:{"minecraft:equippable":{"slot":"head","asset_id":"minecraft:netherite"}}}
item modify entity @s armor.chest {function:"minecraft:set_components",components:{"minecraft:equippable":{"slot":"chest","asset_id":"minecraft:leather"}}}
item modify entity @s armor.legs {function:"minecraft:set_components",components:{"minecraft:equippable":{"slot":"legs","asset_id":"minecraft:leather"}}}
item modify entity @s armor.feet {function:"minecraft:set_components",components:{"minecraft:equippable":{"slot":"feet","asset_id":"minecraft:leather"}}}
