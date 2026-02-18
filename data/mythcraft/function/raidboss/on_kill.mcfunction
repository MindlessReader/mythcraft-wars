# Handle player killing the raid boss
# Triggered by advancement: player_killed_entity with raidBoss tag

# Only process if boss is alive (prevent double-processing)
execute unless score RaidBoss raidBossState matches 1 run return run advancement revoke @s only mythcraft:kill/raidboss_kill

# Record killing team
execute if entity @s[team=Team1] run scoreboard players set RaidBoss raidBossLastHit 1
execute if entity @s[team=Team2] run scoreboard players set RaidBoss raidBossLastHit 2

# Character XP for the killing blow
scoreboard players add @s characterXP 10
function mythcraft:leveling/character/checklevel

# Assassin totem charge (+3 for kill, like player kill)
execute if score @s playerClass matches 2 run function mythcraft:totem/charge {amount:3}

execute if entity @a[tag=debugMode] run say [DEBUG] Raid Boss killed by player

# Process death (VP, rewards, announcements, cleanup)
function mythcraft:raidboss/on_death

# Revoke advancement for reuse
advancement revoke @s only mythcraft:kill/raidboss_kill
