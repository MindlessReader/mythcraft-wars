# Handle player hitting the raid boss
# Triggered by advancement: player_hurt_entity with raidBoss tag

# Only process if boss is alive
execute unless score RaidBoss raidBossState matches 1 run return run advancement revoke @s only mythcraft:kill/raidboss_hit

# Record hitting team (1=Team1, 2=Team2)
execute if entity @s[team=Team1] run scoreboard players set RaidBoss raidBossLastHit 1
execute if entity @s[team=Team2] run scoreboard players set RaidBoss raidBossLastHit 2

# Sync HP from entity into scoreboard
execute store result score RaidBoss raidBossHP run data get entity @e[tag=raidBoss,limit=1] Health 1

# Debug: log HP after hit
execute store result storage mythcraft:temp hp int 1 run scoreboard players get RaidBoss raidBossHP
execute store result storage mythcraft:temp maxHp int 1 run scoreboard players get RaidBoss raidBossMaxHP
execute if entity @a[tag=debugMode] run function mythcraft:debug/raidboss_hit with storage mythcraft:temp

# Check HP thresholds for announcements
function mythcraft:raidboss/check_thresholds

# Revoke advancement for reuse
advancement revoke @s only mythcraft:kill/raidboss_hit
