# update skill levels to match team's levels
execute as @s[team=Druids] run scoreboard players operation @s levelColosseum = Druids levelColosseum
execute as @s[team=Druids] run scoreboard players operation @s levelFort-Reference = Druids levelFort-Reference
execute as @s[team=Druids] run scoreboard players operation @s levelThoth-University = Druids levelThoth-University
execute as @s[team=Druids] run scoreboard players operation @s levelAthena-Library = Druids levelAthena-Library
#
execute as @s[team=Royals] run scoreboard players operation @s levelColosseum = Royals levelColosseum
execute as @s[team=Royals] run scoreboard players operation @s levelFort-Reference = Royals levelFort-Reference
execute as @s[team=Royals] run scoreboard players operation @s levelThoth-University = Royals levelThoth-University
execute as @s[team=Royals] run scoreboard players operation @s levelAthena-Library = Royals levelAthena-Library

# give shield if they don't have one
execute unless items entity @s[scores={levelFort-Reference=1..}] container.* shield run give @s shield[unbreakable={},enchantments={levels:{"minecraft:vanishing_curse":1}}] 1

# get slots of all items that need upgrading
data modify storage mythcraft:kit sword set from entity @s Inventory[{id: "minecraft:iron_sword"}].Slot
data modify storage mythcraft:kit bow set from entity @s Inventory[{id: "minecraft:bow"}].Slot
data modify storage mythcraft:kit axe set from entity @s Inventory[{id: "minecraft:iron_axe"}].Slot

# call item update functions with data if the appropriate items exist
execute if items entity @s container.* minecraft:iron_sword run function mythcraft:leveling/items/sword with storage mythcraft:kit
execute if items entity @s container.* minecraft:bow run function mythcraft:leveling/items/bow with storage mythcraft:kit
execute if items entity @s container.* minecraft:iron_axe run function mythcraft:leveling/items/axe with storage mythcraft:kit

# armor ones are fine here since they target predefined slots
item modify entity @s armor.head mythcraft:helmet
item modify entity @s armor.chest mythcraft:chestplate
item modify entity @s armor.legs mythcraft:leggings
item modify entity @s armor.feet mythcraft:boots