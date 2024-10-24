advancement revoke @s only mythcraft:item/breathspell
scoreboard players set @s[scores={levelThoth-University=1}] SpellBreathCooldown 600
scoreboard players set @s[scores={levelThoth-University=2}] SpellBreathCooldown 300
scoreboard players set @s[scores={levelThoth-University=3}] SpellBreathCooldown 200
scoreboard players set @s[scores={levelThoth-University=4}] SpellBreathCooldown 100
scoreboard players set @s[scores={levelThoth-University=5}] SpellBreathCooldown 60
#summon aoe
execute as @s[team=Druids] run summon area_effect_cloud ^0 ^0 ^1 {Tags:["breath_spell","breath_ownerdruids"],Radius:-1f,Duration:0,Age:-121}
execute as @s[team=Royals] run summon area_effect_cloud ^0 ^0 ^1 {Tags:["breath_spell","breath_ownerroyals"],Radius:-1f,Duration:0,Age:-121}
#replace hand
item replace entity @s weapon.mainhand with glass_bottle[enchantments={levels:{"minecraft:vanishing_curse":1}},max_stack_size=1,custom_name='[{"color":"#DDA0DD","italic":false,"text":"Seeking Breath Bottle"},{"color":"gray","italic":false,"text":" [Empty]"}]',lore=['{"color":"gray","italic":false,"text":"On Cooldown","underlined":true}'],hide_additional_tooltip={},custom_data={mythcraft_breathempty:1b}] 1