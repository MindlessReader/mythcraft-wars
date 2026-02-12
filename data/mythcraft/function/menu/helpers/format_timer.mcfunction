# Format quest timer as M:SS (seconds >= 10)
# Macro params: $(questTimerMin), $(questTimerSec)
$data modify storage mythcraft:temp questTimerDisplay set value "$(questTimerMin):$(questTimerSec)"
