# update skill levels to match team's levels
#execute as @s[team=Druids] run scoreboard players operation @s levelColosseum = Druids levelColosseum
#execute as @s[team=Druids] run scoreboard players operation @s levelFort-Reference = Druids levelFort-Reference
#execute as @s[team=Druids] run scoreboard players operation @s levelThoth-University = Druids levelThoth-University
#execute as @s[team=Druids] run scoreboard players operation @s levelAthena-Library = Druids levelAthena-Library
#
#execute as @s[team=Royals] run scoreboard players operation @s levelColosseum = Royals levelColosseum
#execute as @s[team=Royals] run scoreboard players operation @s levelFort-Reference = Royals levelFort-Reference
#execute as @s[team=Royals] run scoreboard players operation @s levelThoth-University = Royals levelThoth-University
#execute as @s[team=Royals] run scoreboard players operation @s levelAthena-Library = Royals levelAthena-Library


# get slots of all items that need upgrading
data modify storage mythcraft:kit sword set from entity @s Inventory[{id: "minecraft:iron_sword"}].Slot
data modify storage mythcraft:kit bow set from entity @s Inventory[{id: "minecraft:bow"}].Slot

# call item update functions with data if the appropriate items exist
execute if items entity @s container.* minecraft:iron_sword run function mythcraft:leveling/items/sword with storage mythcraft:kit
execute if items entity @s container.* minecraft:bow run function mythcraft:leveling/items/bow with storage mythcraft:kit

# armor ones are fine here since they target predefined slots
item modify entity @s armor.head mythcraft:protection
item modify entity @s armor.chest mythcraft:protection
item modify entity @s armor.legs mythcraft:protection
item modify entity @s armor.feet mythcraft:protection