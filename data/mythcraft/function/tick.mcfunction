execute as @e[type=player,scores={needsRekit=1}] run function mythcraft:rekit

#Spell Rekit/Cooldown/Function
scoreboard players remove @a[scores={SpellBreathCooldown=1..}] SpellBreathCooldown 1
execute as @a[scores={levelThoth-University=1..5,SpellBreathCooldown=0}] run function mythcraft:leveling/refill_breath
execute as @e[type=area_effect_cloud,tag=breath_spell] at @s run function mythcraft:spells/breathseek
#Markers
execute as @e[type=marker,tag=setmarker] at @s run function mythcraft:markers/setcity

# activate mobs
execute as @a[tag=enableTroops,team=Druids] at @s run effect clear @e[tag=cityTroop,distance=..10,team=!Druids] slowness
execute as @a[tag=enableTroops,team=Royals] at @s run effect clear @e[tag=cityTroop,distance=..10,team=!Royals] slowness