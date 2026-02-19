# Handle raid boss death — VP, rewards, announcements, cleanup
# Called from on_kill (player kill advancement only)

# Set state to defeated
scoreboard players set RaidBoss raidBossState 2

# Stop monitor loop
schedule clear mythcraft:raidboss/monitor

# Store winner team ID
execute if score RaidBoss raidBossLastHit matches 1 run data modify storage mythcraft:raidboss winner set value "Team1"
execute if score RaidBoss raidBossLastHit matches 2 run data modify storage mythcraft:raidboss winner set value "Team2"

# Award 1 VP to killing team (if victory_point is in the reward pool)
execute if data storage mythcraft:config {rewards:{raidBossPool:["victory_point"]}} if score RaidBoss raidBossLastHit matches 1 run scoreboard players add Team1 victoryPoints 1
execute if data storage mythcraft:config {rewards:{raidBossPool:["victory_point"]}} if score RaidBoss raidBossLastHit matches 2 run scoreboard players add Team2 victoryPoints 1

# Update VP display
scoreboard players operation @a[team=Team1] victoryPoints = Team1 victoryPoints
scoreboard players operation @a[team=Team2] victoryPoints = Team2 victoryPoints

# Update bossbar
execute as @a run bossbar set mythcraft:victorypointsbar players @s
data modify storage mythcraft:temp team1Name set from storage mythcraft:config teams.Team1.name
data modify storage mythcraft:temp team1Color set from storage mythcraft:config teams.Team1.color
data modify storage mythcraft:temp team2Name set from storage mythcraft:config teams.Team2.name
data modify storage mythcraft:temp team2Color set from storage mythcraft:config teams.Team2.color
function mythcraft:setup/bossbar with storage mythcraft:temp

# Grant ALL rewards from raid boss pool to winning team
execute if score RaidBoss raidBossLastHit matches 1 as @a[team=Team1] run function mythcraft:raidboss/grant_rewards
execute if score RaidBoss raidBossLastHit matches 2 as @a[team=Team2] run function mythcraft:raidboss/grant_rewards

# Resolve team info for announcement
execute if score RaidBoss raidBossLastHit matches 1 run data modify storage mythcraft:temp teamName set from storage mythcraft:config teams.Team1.name
execute if score RaidBoss raidBossLastHit matches 1 run data modify storage mythcraft:temp teamColor set from storage mythcraft:config teams.Team1.color
execute if score RaidBoss raidBossLastHit matches 2 run data modify storage mythcraft:temp teamName set from storage mythcraft:config teams.Team2.name
execute if score RaidBoss raidBossLastHit matches 2 run data modify storage mythcraft:temp teamColor set from storage mythcraft:config teams.Team2.color
data modify storage mythcraft:temp bossDisplayName set from storage mythcraft:raidboss bossDisplayName
function mythcraft:raidboss/announce_victory with storage mythcraft:temp

# Tag killer for cleanup context (cleared after cleanup)
tag @s add _raidBossKiller
# Clean up slime splits — runs every tick for 2 seconds to catch delayed death animations
scoreboard players set RaidBoss cleanupTimer 40
schedule function mythcraft:raidboss/cleanup_splits 2t

data modify storage mythcraft:temp debugWinner set value "no team"
execute if score RaidBoss raidBossLastHit matches 1 run data modify storage mythcraft:temp debugWinner set value "Team1"
execute if score RaidBoss raidBossLastHit matches 2 run data modify storage mythcraft:temp debugWinner set value "Team2"
execute if entity @a[tag=debugMode] run function mythcraft:debug/raidboss_death with storage mythcraft:temp
