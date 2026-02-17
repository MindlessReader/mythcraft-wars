# Recursive loop: spawn one troop at an available marker, decrement _spawnRemaining, recurse
# Requires: poolType, cityName, teamName, cityDisplayName, pools in mythcraft:temp
# Requires: _spawnRemaining score in mathCounter
function mythcraft:respawn/spawn_at_available with storage mythcraft:temp
scoreboard players remove _spawnRemaining mathCounter 1
execute if score _spawnRemaining mathCounter matches 1.. run function mythcraft:respawn/spawn_loop with storage mythcraft:temp
