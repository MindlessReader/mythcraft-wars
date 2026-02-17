# cancel totem stealth if active
execute if score @s totemInvisTimer matches 1.. run function mythcraft:totem/cancel_invis

# clear items
clear @s

# default class for anyone without one
execute unless score @s playerClass matches 1..3 run scoreboard players set @s playerClass 1

# shared items (same for all classes)
item replace entity @s hotbar.7 with compass[enchantments={"minecraft:vanishing_curse":1},max_stack_size=1,food={nutrition:0,saturation:0,can_always_eat:true},consumable={consume_seconds:0.1,animation:"none",sound:"minecraft:intentionally_empty",has_consume_particles:false},lodestone_tracker={tracked:false,target:{dimension:"minecraft:the_end",pos:[I;0,0,0]}},custom_name="Unset, right click to set"]
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

# city rewards (dynamic from config)
execute if score City1 cityOwnership matches 1 as @s[team=Team1] run function mythcraft:rewards/grant_city_rewards {cityId:"City1"}
execute if score City1 cityOwnership matches 2 as @s[team=Team2] run function mythcraft:rewards/grant_city_rewards {cityId:"City1"}
execute if score City2 cityOwnership matches 1 as @s[team=Team1] run function mythcraft:rewards/grant_city_rewards {cityId:"City2"}
execute if score City2 cityOwnership matches 2 as @s[team=Team2] run function mythcraft:rewards/grant_city_rewards {cityId:"City2"}
execute if score City3 cityOwnership matches 1 as @s[team=Team1] run function mythcraft:rewards/grant_city_rewards {cityId:"City3"}
execute if score City3 cityOwnership matches 2 as @s[team=Team2] run function mythcraft:rewards/grant_city_rewards {cityId:"City3"}
execute if score City4 cityOwnership matches 1 as @s[team=Team1] run function mythcraft:rewards/grant_city_rewards {cityId:"City4"}
execute if score City4 cityOwnership matches 2 as @s[team=Team2] run function mythcraft:rewards/grant_city_rewards {cityId:"City4"}
execute if score City5 cityOwnership matches 1 as @s[team=Team1] run function mythcraft:rewards/grant_city_rewards {cityId:"City5"}
execute if score City5 cityOwnership matches 2 as @s[team=Team2] run function mythcraft:rewards/grant_city_rewards {cityId:"City5"}
execute if score City6 cityOwnership matches 1 as @s[team=Team1] run function mythcraft:rewards/grant_city_rewards {cityId:"City6"}
execute if score City6 cityOwnership matches 2 as @s[team=Team2] run function mythcraft:rewards/grant_city_rewards {cityId:"City6"}
execute if score City7 cityOwnership matches 1 as @s[team=Team1] run function mythcraft:rewards/grant_city_rewards {cityId:"City7"}
execute if score City7 cityOwnership matches 2 as @s[team=Team2] run function mythcraft:rewards/grant_city_rewards {cityId:"City7"}

# Magic Spell - Fireball
execute as @s[team=Team1] run scoreboard players operation @s levelMagic = Team1 levelMagic
execute as @s[team=Team2] run scoreboard players operation @s levelMagic = Team2 levelMagic
scoreboard players set @s magicSpellCooldown 0
give @s[scores={levelMagic=1..5}] blaze_rod[enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=true,max_stack_size=1,custom_name=[{color:"gold",italic:false,text:"Fireball"},{color:"white",italic:false,text:" [Tier I]"}],lore=[{color:"gray",italic:false,text:"Ready",underlined:true},{color:"gray",italic:false,text:"Damage: 6 | Radius: 3.0 | Fire: 5s"}],tooltip_display={hidden_components:["minecraft:enchantments"]},custom_data={mythcraft_fireballspell:1b},food={nutrition:0,saturation:0,can_always_eat:true},consumable={consume_seconds:999}] 1

# apply buffs
function mythcraft:applybuffs

# level equipment
function mythcraft:leveling/levelequipment

scoreboard players reset @s needsRekit
