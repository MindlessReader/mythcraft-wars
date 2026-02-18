# Sync twin HP after one is damaged
# The damaged twin has lower health — use it as authoritative, sync the other
# If one twin is already dead, just read the survivor's health directly
# Uses 10x scale for reads/writes to preserve fractional HP (avoids truncation killing wrong twin)

# Guard: if one twin is missing, read the survivor and skip sync
execute unless entity @e[tag=raidBossTwinA] run execute store result score RaidBoss raidBossHP run data get entity @e[tag=raidBossTwinB,limit=1] Health 1
execute unless entity @e[tag=raidBossTwinA] run return 0
execute unless entity @e[tag=raidBossTwinB] run execute store result score RaidBoss raidBossHP run data get entity @e[tag=raidBossTwinA,limit=1] Health 1
execute unless entity @e[tag=raidBossTwinB] run return 0

# Read both twins' health at 10x scale to preserve fractional HP
execute store result score _twinA mathCounter run data get entity @e[tag=raidBossTwinA,limit=1] Health 10
execute store result score _twinB mathCounter run data get entity @e[tag=raidBossTwinB,limit=1] Health 10

# If A was hit (lower health): A is authoritative, sync B to match
execute if score _twinA mathCounter < _twinB mathCounter run execute store result entity @e[tag=raidBossTwinB,limit=1] Health float 0.1 run scoreboard players get _twinA mathCounter

# If B was hit (lower or equal health): B is authoritative, sync A to match
execute if score _twinB mathCounter <= _twinA mathCounter run execute store result entity @e[tag=raidBossTwinA,limit=1] Health float 0.1 run scoreboard players get _twinB mathCounter

# Store HP at normal scale for threshold checks (truncation is fine here)
execute store result score RaidBoss raidBossHP run data get entity @e[tag=raidBossTwinA,limit=1] Health 1
