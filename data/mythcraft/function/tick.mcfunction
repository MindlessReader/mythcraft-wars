execute as @e[type=player,scores={needsRekit=1}] run function mythcraft:rekit

# class selection trigger
scoreboard players enable @a selectClass
execute as @a[scores={selectClass=1..3}] run function mythcraft:selectclass

# default class + enable trigger for new players
execute as @a unless score @s playerClass matches 1..3 run scoreboard players set @s playerClass 1
execute as @a unless score @s selectClass matches 0.. run scoreboard players enable @s selectClass

#Spell Rekit/Cooldown/Function
scoreboard players remove @a[scores={SpellBreathCooldown=1..}] SpellBreathCooldown 1
execute as @a[scores={levelMagic=1..5,SpellBreathCooldown=0}] run function mythcraft:leveling/refill_breath
execute as @e[type=area_effect_cloud,tag=breath_spell] at @s run function mythcraft:spells/breathseek
#Markers
execute as @e[type=marker,tag=setmarker] at @s run function mythcraft:markers/setcity

# activate mobs
execute as @a[tag=enableTroops,team=Team1] at @s run effect clear @e[tag=cityTroop,distance=..10,team=!Team1] slowness
execute as @a[tag=enableTroops,team=Team2] at @s run effect clear @e[tag=cityTroop,distance=..10,team=!Team2] slowness