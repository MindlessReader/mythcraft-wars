advancement revoke @s only mythcraft:item/fireballspell
scoreboard players set @s[scores={levelMagic=1}] magicSpellCooldown 600
scoreboard players set @s[scores={levelMagic=2}] magicSpellCooldown 500
scoreboard players set @s[scores={levelMagic=3}] magicSpellCooldown 400
scoreboard players set @s[scores={levelMagic=4}] magicSpellCooldown 300
scoreboard players set @s[scores={levelMagic=5}] magicSpellCooldown 200
#summon fireball projectile
execute as @s[team=Team1] run summon area_effect_cloud ^0 ^1.5 ^1 {Tags:["fireball_spell","fireball_ownerteam1","newFireball"],Radius:0.5f,Duration:200,Particle:{type:"minecraft:flame"}}
execute as @s[team=Team2] run summon area_effect_cloud ^0 ^1.5 ^1 {Tags:["fireball_spell","fireball_ownerteam2","newFireball"],Radius:0.5f,Duration:200,Particle:{type:"minecraft:flame"}}
#copy player rotation to fireball so it goes in the right direction
data modify entity @e[tag=newFireball,limit=1,sort=nearest] Rotation set from entity @s Rotation
#copy magic level for scaling
scoreboard players operation @e[tag=newFireball,limit=1,sort=nearest] levelMagic = @s levelMagic
tag @e[tag=newFireball] remove newFireball
#replace hand with cooldown indicator
item replace entity @s weapon.mainhand with breeze_rod[enchantments={"minecraft:vanishing_curse":1},max_stack_size=1,tooltip_display={hidden_components:["minecraft:enchantments"]},custom_data={mythcraft_fireballempty:1b}] 1
item modify entity @s weapon.mainhand mythcraft:fireball_cooldown
