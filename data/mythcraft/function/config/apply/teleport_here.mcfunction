# Save the player's current position as the teleport coordinates for a location
# Macro params: $(path), $(locName)
$execute store result storage mythcraft:config $(path).teleport.x int 1 run data get entity @s Pos[0] 1
$execute store result storage mythcraft:config $(path).teleport.y int 1 run data get entity @s Pos[1] 1
$execute store result storage mythcraft:config $(path).teleport.z int 1 run data get entity @s Pos[2] 1
$execute store result storage mythcraft:config $(path).teleport.yaw int 1 run data get entity @s Rotation[0] 1
$execute store result storage mythcraft:config $(path).teleport.pitch int 1 run data get entity @s Rotation[1] 1

# Re-open the edit dialog to show updated values
$function mythcraft:config/edit/teleport {path:"$(path)",locName:"$(locName)"}
