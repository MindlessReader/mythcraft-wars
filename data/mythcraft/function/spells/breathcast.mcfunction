# LEGACY SYSTEM - Dragon's Breath spell (replaced by Fireball)
# Preserved for potential future use or reference
# To re-enable: uncomment dragon_breath line in rekit.mcfunction (line ~39)
# and uncomment breath tracking in tick.mcfunction (line ~15)

advancement revoke @s only mythcraft:item/breathspell
scoreboard players set @s[scores={levelMagic=1}] magicSpellCooldown 600
scoreboard players set @s[scores={levelMagic=2}] magicSpellCooldown 300
scoreboard players set @s[scores={levelMagic=3}] magicSpellCooldown 200
scoreboard players set @s[scores={levelMagic=4}] magicSpellCooldown 100
scoreboard players set @s[scores={levelMagic=5}] magicSpellCooldown 60
#summon aoe
execute as @s[team=Team1] run summon area_effect_cloud ^0 ^0 ^1 {Tags:["breath_spell","breath_ownerteam1"],Radius:-1f,Duration:0,Age:-121}
execute as @s[team=Team2] run summon area_effect_cloud ^0 ^0 ^1 {Tags:["breath_spell","breath_ownerteam2"],Radius:-1f,Duration:0,Age:-121}
#replace hand
item replace entity @s weapon.mainhand with glass_bottle[enchantments={"minecraft:vanishing_curse":1},max_stack_size=1,custom_name=[{color:"#DDA0DD",italic:false,text:"Seeking Breath Bottle"},{color:"gray",italic:false,text:" [Empty]"}],lore=[{color:"gray",italic:false,text:"On Cooldown",underlined:true}],tooltip_display={hidden_components:["minecraft:enchantments"]},custom_data={mythcraft_breathempty:1b}] 1
