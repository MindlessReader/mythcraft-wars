# Schedule raid boss spawn during the pre-game period
# Safe window: [15, preGameDuration-15] seconds after game start

execute store result score _raidWindow mathCounter run data get storage mythcraft:config game.preGameDuration
scoreboard players remove _raidWindow mathCounter 30

# If window is too small (preGameDuration < 30), use 15s flat delay
execute if score _raidWindow mathCounter matches ..0 run scoreboard players set _raidWindow mathCounter 1

# Pick random delay within window
execute store result storage mythcraft:temp max int 1 run scoreboard players get _raidWindow mathCounter
execute store result score _raidDelay mathCounter run function mythcraft:getrandomnumber with storage mythcraft:temp
scoreboard players add _raidDelay mathCounter 14

# Schedule the spawn attempt
execute store result storage mythcraft:temp duration int 1 run scoreboard players get _raidDelay mathCounter
function mythcraft:schedule/raidboss_spawn with storage mythcraft:temp

execute store result storage mythcraft:temp delay int 1 run scoreboard players get _raidDelay mathCounter
execute if entity @a[tag=debugMode] run function mythcraft:debug/raidboss_pregame_schedule with storage mythcraft:temp
