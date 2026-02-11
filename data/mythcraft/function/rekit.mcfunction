# clear items
clear @s

# default class for anyone without one
execute unless score @s playerClass matches 1..3 run scoreboard players set @s playerClass 1

# shared items (same for all classes)
item replace entity @s hotbar.7 with compass[enchantments={"minecraft:vanishing_curse":1},max_stack_size=1,food={nutrition:0,saturation:0,can_always_eat:true},consumable={consume_seconds:0.1},lodestone_tracker={tracked:false,target:{dimension:"minecraft:the_end",pos:[I;0,0,0]}},custom_name="Unset, right click to set"]
item replace entity @s hotbar.8 with cooked_beef[enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false] 64
item replace entity @s inventory.8 with arrow[enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false] 64

# class-specific weapons and offhand
execute if score @s playerClass matches 1 run function mythcraft:rekit/warrior
execute if score @s playerClass matches 2 run function mythcraft:rekit/assassin
execute if score @s playerClass matches 3 run function mythcraft:rekit/bastion

# class-specific armor with team trims
execute if score @s playerClass matches 1 as @s[team=Team1] run function mythcraft:rekit/armor_warrior with storage mythcraft:config teams.Team1
execute if score @s playerClass matches 1 as @s[team=Team2] run function mythcraft:rekit/armor_warrior with storage mythcraft:config teams.Team2
execute if score @s playerClass matches 2 as @s[team=Team1] run function mythcraft:rekit/armor_assassin with storage mythcraft:config teams.Team1
execute if score @s playerClass matches 2 as @s[team=Team2] run function mythcraft:rekit/armor_assassin with storage mythcraft:config teams.Team2
execute if score @s playerClass matches 3 as @s[team=Team1] run function mythcraft:rekit/applyarmor with storage mythcraft:config teams.Team1
execute if score @s playerClass matches 3 as @s[team=Team2] run function mythcraft:rekit/applyarmor with storage mythcraft:config teams.Team2

# apply armor/toughness attributes based on class + character level
function mythcraft:leveling/character/setattributes

# city benefits (/items at top to make sure nothing is overwritten)
execute if score City6 cityOwnership matches 1 run item replace entity @s[team=Team1] hotbar.8 with bread[food={nutrition:8,saturation:12.8},consumable={consume_seconds:0.432},enchantments={"minecraft:vanishing_curse":1},custom_name="Nourishing Bread"] 64
execute if score City6 cityOwnership matches 2 run item replace entity @s[team=Team2] hotbar.8 with bread[food={nutrition:8,saturation:12.8},consumable={consume_seconds:0.432},enchantments={"minecraft:vanishing_curse":1},custom_name="Nourishing Bread"] 64

# Magic Spell (had to put this in the middle of the city benefits since its a /give)
execute as @s[team=Team1] run scoreboard players operation @s levelMagic = Team1 levelMagic
execute as @s[team=Team2] run scoreboard players operation @s levelMagic = Team2 levelMagic
scoreboard players set @s SpellBreathCooldown 0
give @s[scores={levelMagic=1..5}] dragon_breath[enchantments={"minecraft:vanishing_curse":1},max_stack_size=1,custom_name=[{color:"#DDA0DD",italic:false,text:"Seeking Breath"},{color:"white",italic:false,text:" [Cold]"}],lore=[{color:"gray",italic:false,text:"Cooldown: 30s",underlined:true}],tooltip_display={hidden_components:["minecraft:enchantments"]},custom_data={mythcraft_breathspell:1b},food={nutrition:0,saturation:0,can_always_eat:true},consumable={consume_seconds:999}] 1
#

execute if score City3 cityOwnership matches 1 as @s[team=Team1] run function mythcraft:kill/giveequipment/city3
execute if score City3 cityOwnership matches 2 as @s[team=Team2] run function mythcraft:kill/giveequipment/city3

execute if score City2 cityOwnership matches 1 as @s[team=Team1] run function mythcraft:kill/giveequipment/city2
execute if score City2 cityOwnership matches 2 as @s[team=Team2] run function mythcraft:kill/giveequipment/city2

execute if score City1 cityOwnership matches 1 as @s[team=Team1] run function mythcraft:kill/giveequipment/city1
execute if score City1 cityOwnership matches 2 as @s[team=Team2] run function mythcraft:kill/giveequipment/city1

execute if score City5 cityOwnership matches 1 as @s[team=Team1] run function mythcraft:kill/giveequipment/city5
execute if score City5 cityOwnership matches 2 as @s[team=Team2] run function mythcraft:kill/giveequipment/city5

execute if score City7 cityOwnership matches 1 as @s[team=Team1] run function mythcraft:kill/giveequipment/city7
execute if score City7 cityOwnership matches 2 as @s[team=Team2] run function mythcraft:kill/giveequipment/city7

execute if score City4 cityOwnership matches 1 as @s[team=Team1] run function mythcraft:kill/giveequipment/city4
execute if score City4 cityOwnership matches 2 as @s[team=Team2] run function mythcraft:kill/giveequipment/city4

# apply buffs
function mythcraft:applybuffs

# level equipment
function mythcraft:leveling/levelequipment

scoreboard players reset @s needsRekit
