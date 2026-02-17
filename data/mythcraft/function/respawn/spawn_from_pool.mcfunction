# Spawn a troop from the appropriate pool based on poolType in temp
# Called at marker position; pools and city info must be in mythcraft:temp
execute if data storage mythcraft:temp {poolType:"regular"} run function mythcraft:respawn/pick_regular
execute if data storage mythcraft:temp {poolType:"boss"} run function mythcraft:respawn/pick_boss
