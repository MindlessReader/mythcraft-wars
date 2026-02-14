# Make all armor pieces invisible by setting equippable asset_id to invisible model
# Requires resource pack with assets/mythcraft/equipment/invisible.json
item modify entity @s armor.head {function:"minecraft:set_components",components:{"minecraft:equippable":{"slot":"head","asset_id":"mythcraft:invisible"}}}
item modify entity @s armor.chest {function:"minecraft:set_components",components:{"minecraft:equippable":{"slot":"chest","asset_id":"mythcraft:invisible"}}}
item modify entity @s armor.legs {function:"minecraft:set_components",components:{"minecraft:equippable":{"slot":"legs","asset_id":"mythcraft:invisible"}}}
item modify entity @s armor.feet {function:"minecraft:set_components",components:{"minecraft:equippable":{"slot":"feet","asset_id":"mythcraft:invisible"}}}
