# Announce HP threshold with team attribution
# Params: $(teamName), $(teamColor), $(percent), $(bossDisplayName)
$tellraw @a [{text:"[Raid Boss] ",color:"dark_purple",bold:true},{color:"$(teamColor)",text:"$(teamName)",bold:true},{text:" have reduced ",color:"white",bold:false},{text:"$(bossDisplayName)",color:"dark_purple",bold:true},{text:" to ",color:"white",bold:false},{text:"$(percent)",color:"red",bold:true},{text:" HP!",color:"white",bold:false}]
execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1.0 0.5
