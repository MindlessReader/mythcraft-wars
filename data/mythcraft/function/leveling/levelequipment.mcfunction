# update skill levels to match team's levels
execute as @s[team=Team1] run scoreboard players operation @s levelAttack = Team1 levelAttack
execute as @s[team=Team1] run scoreboard players operation @s levelDefense = Team1 levelDefense
execute as @s[team=Team1] run scoreboard players operation @s levelMagic = Team1 levelMagic
execute as @s[team=Team1] run scoreboard players operation @s levelSpecial = Team1 levelSpecial
#
execute as @s[team=Team2] run scoreboard players operation @s levelAttack = Team2 levelAttack
execute as @s[team=Team2] run scoreboard players operation @s levelDefense = Team2 levelDefense
execute as @s[team=Team2] run scoreboard players operation @s levelMagic = Team2 levelMagic
execute as @s[team=Team2] run scoreboard players operation @s levelSpecial = Team2 levelSpecial

# give shield if they don't have one
execute store result score @s mathCounter run clear @s shield 0
execute as @s[scores={mathCounter=0}] run give @s[scores={levelDefense=1..}] shield[unbreakable={},enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=true,tooltip_display={hidden_components:["minecraft:enchantments"]}] 1
#give Dragon breath Spell from Thoth U leveling if they dont have one
execute unless items entity @s[scores={levelMagic=1..5}] container.* dragon_breath unless items entity @s container.* glass_bottle run give @s[scores={levelMagic=1..5}] dragon_breath[enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=true,max_stack_size=1,custom_name=[{color:"#DDA0DD",italic:false,text:"Seeking Breath"},{color:"white",italic:false,text:" [Cold]"}],lore=[{color:"gray",italic:false,text:"Cooldown: 30s",underlined:true}],tooltip_display={hidden_components:["minecraft:enchantments"]},custom_data={mythcraft_breathspell:1b},food={nutrition:0,saturation:0,can_always_eat:true},consumable={consume_seconds:999}] 1

# get slots of all items that need upgrading
data modify storage mythcraft:kit sword set from entity @s Inventory[{id: "minecraft:iron_sword"}].Slot
data modify storage mythcraft:kit bow set from entity @s Inventory[{id: "minecraft:bow"}].Slot
data modify storage mythcraft:kit axe set from entity @s Inventory[{id: "minecraft:iron_axe"}].Slot
data modify storage mythcraft:kit breath set from entity @s Inventory[{id: "minecraft:glass_bottle",components:{"minecraft:custom_data":{mythcraft_breathempty:1b}}}].Slot
data modify storage mythcraft:kit breath set from entity @s Inventory[{id: "minecraft:dragon_breath",components:{"minecraft:custom_data":{mythcraft_breathspell:1b}}}].Slot
data modify storage mythcraft:kit crossbow set from entity @s Inventory[{id: "minecraft:crossbow"}].Slot
data modify storage mythcraft:kit mace set from entity @s Inventory[{id: "minecraft:mace"}].Slot
data modify storage mythcraft:kit spear set from entity @s Inventory[{id: "minecraft:iron_spear"}].Slot

# call item update functions with data if the appropriate items exist
execute if items entity @s container.* minecraft:iron_sword run function mythcraft:leveling/items/sword with storage mythcraft:kit
execute if items entity @s container.* minecraft:bow run function mythcraft:leveling/items/bow with storage mythcraft:kit
execute if items entity @s container.* minecraft:iron_axe run function mythcraft:leveling/items/axe with storage mythcraft:kit
execute if items entity @s container.* minecraft:dragon_breath run function mythcraft:leveling/items/breath with storage mythcraft:kit
execute if items entity @s container.* minecraft:glass_bottle run function mythcraft:leveling/items/breath with storage mythcraft:kit
execute if items entity @s container.* minecraft:crossbow run function mythcraft:leveling/items/crossbow with storage mythcraft:kit
execute if items entity @s container.* minecraft:mace run function mythcraft:leveling/items/mace with storage mythcraft:kit
execute if items entity @s container.* minecraft:iron_spear run function mythcraft:leveling/items/spear with storage mythcraft:kit

# armor ones are fine here since they target predefined slots
item modify entity @s armor.head mythcraft:helmet
item modify entity @s armor.chest mythcraft:chestplate
item modify entity @s armor.legs mythcraft:leggings
item modify entity @s armor.feet mythcraft:boots