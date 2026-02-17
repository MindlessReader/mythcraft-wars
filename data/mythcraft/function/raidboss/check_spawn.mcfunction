# Check if a raid boss should spawn during this quest
# Called from startquest.mcfunction after quest setup

# Only proceed if boss hasn't spawned yet
execute unless score RaidBoss raidBossState matches 0 run return 0

# Compute current quest number: (questCount + 1) - questsRemaining
execute store result score _currentQuest mathCounter run data get storage mythcraft:config game.questCount
scoreboard players add _currentQuest mathCounter 1
scoreboard players operation _currentQuest mathCounter -= QuestTracker questsRemaining

# Compare to scheduled quest slot
execute store result score _scheduledQuest mathCounter run data get storage mythcraft:raidboss scheduledQuest
execute unless score _currentQuest mathCounter = _scheduledQuest mathCounter run return 0

# This is the quest! Schedule spawn within safe window [15, questDuration-15]
execute store result score _raidWindow mathCounter run data get storage mythcraft:config game.questDuration
scoreboard players remove _raidWindow mathCounter 30

# If window is too small (questDuration < 30), use 15s flat delay
execute if score _raidWindow mathCounter matches ..0 run scoreboard players set _raidWindow mathCounter 1

# Pick random delay within window
execute store result storage mythcraft:temp max int 1 run scoreboard players get _raidWindow mathCounter
execute store result score _raidDelay mathCounter run function mythcraft:getrandomnumber with storage mythcraft:temp
scoreboard players add _raidDelay mathCounter 14

# Schedule the spawn attempt
execute store result storage mythcraft:temp duration int 1 run scoreboard players get _raidDelay mathCounter
function mythcraft:schedule/raidboss_spawn with storage mythcraft:temp
