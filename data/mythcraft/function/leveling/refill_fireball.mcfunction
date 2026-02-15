data modify storage mythcraft:kit magicSpell set from entity @s Inventory[{id: "minecraft:breeze_rod",components:{"minecraft:custom_data":{mythcraft_fireballempty:1b}}}].Slot
data modify storage mythcraft:kit magicSpell set from entity @s Inventory[{id: "minecraft:blaze_rod",components:{"minecraft:custom_data":{mythcraft_fireballspell:1b}}}].Slot
execute if items entity @s container.* minecraft:blaze_rod run function mythcraft:leveling/items/fireball with storage mythcraft:kit
execute if items entity @s container.* minecraft:breeze_rod at @s run playsound minecraft:block.fire.ambient master @s ~ ~ ~ 0.5 2.0
execute if items entity @s container.* minecraft:breeze_rod run function mythcraft:leveling/items/fireball with storage mythcraft:kit
