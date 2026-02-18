# Mark the threshold as announced and resolve team info for the message
# Params: $(percent) — e.g. "75%"

# Store percent into temp so we can check it without macro on every line
$data modify storage mythcraft:temp percent set value "$(percent)"
$execute if entity @a[tag=debugMode] run say [DEBUG] Raid Boss HP crossed $(percent) threshold

# Mark threshold as announced (check all three since we might cross multiple in one hit)
execute if data storage mythcraft:temp {percent:"75%"} run data modify storage mythcraft:raidboss announced75 set value 1b
execute if data storage mythcraft:temp {percent:"50%"} run data modify storage mythcraft:raidboss announced50 set value 1b
execute if data storage mythcraft:temp {percent:"25%"} run data modify storage mythcraft:raidboss announced25 set value 1b

# Grant 5 character XP to the player who triggered the threshold
scoreboard players add @s characterXP 5
function mythcraft:leveling/character/checklevel

# Grant 5 skill XP if boss is at a skill location
function mythcraft:raidboss/grant_skill_xp {amount:5}

# Assassin totem charge (+5 per threshold)
execute if score @s playerClass matches 2 run function mythcraft:totem/charge {amount:5}

# Resolve last-hit team display info
execute if score RaidBoss raidBossLastHit matches 1 run data modify storage mythcraft:temp teamName set from storage mythcraft:config teams.Team1.name
execute if score RaidBoss raidBossLastHit matches 1 run data modify storage mythcraft:temp teamColor set from storage mythcraft:config teams.Team1.color
execute if score RaidBoss raidBossLastHit matches 2 run data modify storage mythcraft:temp teamName set from storage mythcraft:config teams.Team2.name
execute if score RaidBoss raidBossLastHit matches 2 run data modify storage mythcraft:temp teamColor set from storage mythcraft:config teams.Team2.color

# Copy boss display name into temp for the message
data modify storage mythcraft:temp bossDisplayName set from storage mythcraft:raidboss bossDisplayName

# Call message function with resolved params
function mythcraft:raidboss/announce_threshold_msg with storage mythcraft:temp
