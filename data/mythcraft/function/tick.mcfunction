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

# Admin menu
execute as @a[tag=admin,scores={openMenu=4}] run function mythcraft:admin/open
execute as @a[tag=!admin,scores={openMenu=4}] run scoreboard players set @s openMenu 0
scoreboard players enable @a[tag=admin] adminAction
execute as @a[tag=admin,scores={adminAction=1}] run function mythcraft:config/open
execute as @a[tag=admin,scores={adminAction=1}] run scoreboard players set @s adminAction 0
execute as @a[tag=admin,scores={adminAction=2}] run function mythcraft:admin/conquer/open
execute as @a[tag=admin,scores={adminAction=3}] run function mythcraft:admin/marker/start
execute as @a[tag=admin,scores={adminAction=4}] run function mythcraft:admin/toggle_debug
execute as @a[tag=admin,scores={adminAction=5}] run function mythcraft:admin/toggle_godmode
execute as @a[tag=admin,scores={adminAction=6}] run function mythcraft:admin/start_game
execute as @a[tag=admin,scores={adminAction=7}] run function mythcraft:admin/respawn_all
execute as @a[tag=admin,scores={adminAction=8}] run function mythcraft:admin/give_markers
execute as @a[tag=admin,scores={adminAction=9}] run function mythcraft:admin/delete_markers
execute as @a[tag=admin,scores={adminAction=10}] run function mythcraft:admin/delete_markers_confirm
execute as @a[tag=admin,scores={adminAction=20}] run function mythcraft:admin/marker/stop
execute as @a[tag=admin,scores={adminAction=21}] run function mythcraft:admin/marker/confirm

# Marker helper live update
execute if entity @a[tag=markerHelperActive] run function mythcraft:admin/marker/update

# assassin totem — actual death save (marker effect from death_protection)
execute as @a[scores={playerClass=2}] if predicate mythcraft:totem_death_save run function mythcraft:totem/on_death_save
# totem validation: strip death_protection from charged totems held by wrong player (offhand + mainhand)
execute as @a unless score @s playerClass matches 2 if items entity @s weapon.offhand totem_of_undying[custom_data~{mythcraft_totem:true},enchantment_glint_override=true] run item modify entity @s weapon.offhand mythcraft:totem_uncharged
execute as @a unless score @s playerClass matches 2 if items entity @s weapon.mainhand totem_of_undying[custom_data~{mythcraft_totem:true},enchantment_glint_override=true] run item modify entity @s weapon.mainhand mythcraft:totem_uncharged
execute as @a[scores={playerClass=2}] if items entity @s weapon.offhand totem_of_undying[custom_data~{mythcraft_totem:true},enchantment_glint_override=true] run function mythcraft:totem/validate
execute as @a[scores={playerClass=2}] if items entity @s weapon.mainhand totem_of_undying[custom_data~{mythcraft_totem:true},enchantment_glint_override=true] run function mythcraft:totem/validate_mainhand
# stealth timer (generic — used by totem, kelp, etc.)
execute as @a[scores={stealthTimer=1}] run function mythcraft:stealth/end
scoreboard players remove @a[scores={stealthTimer=1..}] stealthTimer 1

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

# team-tag vexes spawned by evoker troops (prevents friendly fire)
execute as @e[type=evoker,tag=cityTroop,team=Team1] at @s run team join Team1 @e[type=vex,distance=..32]
execute as @e[type=evoker,tag=cityTroop,team=Team2] at @s run team join Team2 @e[type=vex,distance=..32]

# clean up slime troop split children instantly (Size:0 children inherit tags but not DeathLootTable)
execute as @e[type=slime,tag=cityTroop,nbt={Size:0}] run data merge entity @s {DeathLootTable:"minecraft:empty"}
kill @e[type=slime,tag=cityTroop,nbt={Size:0}]

# god mode: one-hit strength + bypass troop grace period (separate from debugMode to avoid log spam)
execute as @a[tag=godMode] run effect give @s minecraft:strength infinite 100 true
execute if entity @a[tag=godMode] as @e[tag=_gracePeriod] run data merge entity @s {Invulnerable:0b}
execute if entity @a[tag=godMode] run tag @e[tag=_gracePeriod] remove _gracePeriod