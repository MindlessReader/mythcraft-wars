# Entity-specific setup after the boss entity has been summoned
# Called from spawn templates (e.g. giant_slime.mcfunction)

# Read max HP from the spawned entity into scoreboard
execute store result score RaidBoss raidBossMaxHP run data get entity @e[tag=raidBoss,limit=1] Health 1
scoreboard players operation RaidBoss raidBossHP = RaidBoss raidBossMaxHP

# Mark state as alive
scoreboard players set RaidBoss raidBossState 1
scoreboard players set RaidBoss raidBossLastHit 0

# Start monitor loop (tether + fallback death detection, 1s interval)
schedule function mythcraft:raidboss/monitor 1s

execute store result storage mythcraft:temp hp int 1 run scoreboard players get RaidBoss raidBossMaxHP
data modify storage mythcraft:temp debugBossType set from storage mythcraft:raidboss bossType
execute if entity @a[tag=debugMode] run function mythcraft:debug/raidboss_spawned with storage mythcraft:temp
