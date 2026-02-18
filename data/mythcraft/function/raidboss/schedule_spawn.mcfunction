# Pick a random game phase for the raid boss to spawn and schedule it
# Called from startgame.mcfunction
# Slot 0 = pre-game period, 1+ = during that quest number

# Pick random slot: 0 to questCount-1 (questCount slots total)
execute store result storage mythcraft:temp max int 1 run data get storage mythcraft:config game.questCount
execute store result score _raidSlot mathCounter run function mythcraft:getrandomnumber with storage mythcraft:temp
# getrandomnumber returns 1..max, subtract 1 to get 0..max-1
scoreboard players remove _raidSlot mathCounter 1
execute store result storage mythcraft:raidboss scheduledQuest int 1 run scoreboard players get _raidSlot mathCounter

# Reset state
scoreboard players set RaidBoss raidBossState 0
scoreboard players set RaidBoss raidBossHP 0
scoreboard players set RaidBoss raidBossMaxHP 0
scoreboard players set RaidBoss raidBossLastHit 0
data modify storage mythcraft:raidboss announced75 set value 0b
data modify storage mythcraft:raidboss announced50 set value 0b
data modify storage mythcraft:raidboss announced25 set value 0b
data remove storage mythcraft:raidboss winner

# If slot 0 (pre-game), schedule spawn now within safe window [15, preGameDuration-15]
execute if score _raidSlot mathCounter matches 0 run function mythcraft:raidboss/schedule_pregame_spawn

execute store result storage mythcraft:temp slot int 1 run scoreboard players get _raidSlot mathCounter
execute if entity @a[tag=debugMode] run function mythcraft:debug/raidboss_schedule with storage mythcraft:temp
