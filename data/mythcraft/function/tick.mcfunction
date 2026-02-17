execute as @e[type=player,scores={needsRekit=1}] run function mythcraft:rekit

# class selection trigger
scoreboard players enable @a selectClass
execute as @a[scores={selectClass=1..3}] run function mythcraft:selectclass

# default class + enable trigger for new players
execute as @a unless score @s playerClass matches 1..3 run scoreboard players set @s playerClass 1
execute as @a unless score @s selectClass matches 0.. run scoreboard players enable @s selectClass

#Spell Rekit/Cooldown/Function
scoreboard players remove @a[scores={magicSpellCooldown=1..}] magicSpellCooldown 1
scoreboard players remove @a[scores={totemCooldown=1..}] totemCooldown 1
execute as @a[scores={levelMagic=1..5,magicSpellCooldown=0}] run function mythcraft:leveling/refill_fireball
# LEGACY - Dragon's breath tracking (preserved; won't trigger without dragon_breath items)
# execute as @e[type=area_effect_cloud,tag=breath_spell] at @s run function mythcraft:spells/breathseek
# Fireball tracking
execute as @e[type=area_effect_cloud,tag=fireball_spell] at @s run function mythcraft:spells/fireballtrack
#Markers
execute as @e[type=marker,tag=setmarker] at @s run function mythcraft:markers/setcity

# Player menu (sub-dialog navigation via triggers)
scoreboard players enable @a openMenu
execute as @a[scores={openMenu=1}] run function mythcraft:menu/open
execute as @a[scores={openMenu=2}] run function mythcraft:menu/classselect_open
execute as @a[scores={openMenu=3}] run function mythcraft:menu/questhistory_open

# Teleport
scoreboard players enable @a teleportLocation
execute as @a[scores={teleportLocation=1..11}] run function mythcraft:menu/teleport

# assassin totem — actual death save (marker effect from death_protection)
execute as @a[scores={playerClass=2}] if predicate mythcraft:totem_death_save run function mythcraft:totem/on_death_save
# totem validation: strip death_protection from charged totems held by wrong player (offhand + mainhand)
execute as @a unless score @s playerClass matches 2 if items entity @s weapon.offhand totem_of_undying[custom_data~{mythcraft_totem:true},enchantment_glint_override=true] run item modify entity @s weapon.offhand mythcraft:totem_uncharged
execute as @a unless score @s playerClass matches 2 if items entity @s weapon.mainhand totem_of_undying[custom_data~{mythcraft_totem:true},enchantment_glint_override=true] run item modify entity @s weapon.mainhand mythcraft:totem_uncharged
execute as @a[scores={playerClass=2}] if items entity @s weapon.offhand totem_of_undying[custom_data~{mythcraft_totem:true},enchantment_glint_override=true] run function mythcraft:totem/validate
execute as @a[scores={playerClass=2}] if items entity @s weapon.mainhand totem_of_undying[custom_data~{mythcraft_totem:true},enchantment_glint_override=true] run function mythcraft:totem/validate_mainhand
# totem stealth timer
execute as @a[scores={totemInvisTimer=1}] run function mythcraft:totem/end_stealth
scoreboard players remove @a[scores={totemInvisTimer=1..}] totemInvisTimer 1

# bastion parry — shield tracking and cooldown
scoreboard players remove @a[scores={parryWindow=1..}] parryWindow 1
execute as @a[scores={playerClass=3,parryCooldown=1}] at @s run playsound minecraft:block.anvil.land master @s ~ ~ ~ 0.8 1.5
scoreboard players remove @a[scores={parryCooldown=1..}] parryCooldown 1
execute as @a[scores={_shieldTick=1}] run scoreboard players set @s _wasBlocking 1
execute as @a[scores={_shieldTick=0,_wasBlocking=1}] run scoreboard players set @s _wasBlocking 0
scoreboard players set @a[scores={_shieldTick=1}] _shieldTick 0

# bastion mortar shot — override detection
execute as @a[scores={playerClass=3,_crossbowLoaded=0,mortarCooldown=0,_mortarLoaded=0}] if items entity @s hotbar.1 crossbow[!charged_projectiles=[]] if predicate mythcraft:is_sneaking at @s run function mythcraft:mortar/override_load
execute as @a[scores={playerClass=3}] if items entity @s hotbar.1 crossbow[!charged_projectiles=[]] run scoreboard players set @s _crossbowLoaded 1
execute as @a[scores={playerClass=3}] unless items entity @s hotbar.1 crossbow[!charged_projectiles=[]] run scoreboard players set @s _crossbowLoaded 0
execute as @a[scores={playerClass=3,mortarCooldown=1}] at @s run playsound minecraft:entity.firework_rocket.launch master @s ~ ~ ~ 1.0 1.2
scoreboard players remove @a[scores={mortarCooldown=1..}] mortarCooldown 1
# mortar tracker teleportation and orphan detection
execute as @e[type=marker,tag=mortarTracker] at @s run function mythcraft:mortar/track_firework
# mortar field tick
execute as @e[type=marker,tag=mortarField] at @s run function mythcraft:mortar/field_tick

# troop indicator — show nearby city troop count on XP bar; kill XP orbs to prevent interference
kill @e[type=experience_orb]
execute as @a at @s run function mythcraft:troop_indicator/update

# activate mobs
execute as @a[tag=enableTroops,team=Team1] at @s run effect clear @e[tag=cityTroop,distance=..10,team=!Team1] slowness
execute as @a[tag=enableTroops,team=Team2] at @s run effect clear @e[tag=cityTroop,distance=..10,team=!Team2] slowness

# god mode: one-hit strength + bypass troop grace period resistance (separate from debugMode to avoid log spam)
execute as @a[tag=godMode] run effect give @s minecraft:strength infinite 100 true
execute if entity @a[tag=godMode] run effect clear @e[type=!player] minecraft:resistance