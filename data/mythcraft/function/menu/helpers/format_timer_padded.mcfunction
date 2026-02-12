# Format quest timer as M:0S (seconds < 10, zero-padded)
# Macro params: $(questTimerMin), $(questTimerSec)
$data modify storage mythcraft:temp questTimerDisplay set value "$(questTimerMin):0$(questTimerSec)"
