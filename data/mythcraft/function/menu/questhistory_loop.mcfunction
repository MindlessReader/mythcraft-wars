# Recursive loop: process one quest entry per iteration
# Uses _loopIdx (0-based) and _questCount on mathCounter scoreboard

# Compute 1-based display number
scoreboard players operation _displayNum mathCounter = _loopIdx mathCounter
scoreboard players add _displayNum mathCounter 1

# Store params for loadentry macro
execute store result storage mythcraft:temp loopIndex int 1 run scoreboard players get _loopIdx mathCounter
execute store result storage mythcraft:temp loopNum int 1 run scoreboard players get _displayNum mathCounter

# Load this entry and append to body
function mythcraft:menu/questhistory_loadentry with storage mythcraft:temp

# Increment and recurse if more entries remain
scoreboard players add _loopIdx mathCounter 1
execute if score _loopIdx mathCounter < _questCount mathCounter run function mythcraft:menu/questhistory_loop
