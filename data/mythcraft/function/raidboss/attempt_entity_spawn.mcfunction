# Try to spawn the raid boss entity at its marker
# Params: $(cityName) — location tag for the marker (e.g. "City3", "Attack")
# Requires mythcraft:temp to have bossType and cityDisplayName already set
# On success: post_spawn sets raidBossState to 1 and spawnPending is cleared

$execute if entity @e[type=marker,tag=spawnmarker_raidboss,tag=$(cityName),limit=1] at @e[type=marker,tag=spawnmarker_raidboss,tag=$(cityName),limit=1] run function mythcraft:raidboss/spawn_type with storage mythcraft:temp

# If spawn succeeded (post_spawn sets state to 1), clear pending flag
execute if score RaidBoss raidBossState matches 1 run data modify storage mythcraft:raidboss spawnPending set value 0b
