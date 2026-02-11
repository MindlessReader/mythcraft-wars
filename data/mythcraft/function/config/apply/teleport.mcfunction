# Apply teleport coordinate changes
# Macro params: $(path), $(tpX), $(tpY), $(tpZ), $(tpYaw), $(tpPitch)

# Convert text values to int and store
$data modify storage mythcraft:temp xTemp set value $(tpX)
$execute store result storage mythcraft:config $(path).teleport.x int 1 run data get storage mythcraft:temp xTemp 1
$data modify storage mythcraft:temp yTemp set value $(tpY)
$execute store result storage mythcraft:config $(path).teleport.y int 1 run data get storage mythcraft:temp yTemp 1
$data modify storage mythcraft:temp zTemp set value $(tpZ)
$execute store result storage mythcraft:config $(path).teleport.z int 1 run data get storage mythcraft:temp zTemp 1
$data modify storage mythcraft:temp yawTemp set value $(tpYaw)
$execute store result storage mythcraft:config $(path).teleport.yaw int 1 run data get storage mythcraft:temp yawTemp 1
$data modify storage mythcraft:temp pitchTemp set value $(tpPitch)
$execute store result storage mythcraft:config $(path).teleport.pitch int 1 run data get storage mythcraft:temp pitchTemp 1

# Navigate back to the editor that opened the teleport chain
function mythcraft:config/teleport_nav_back
