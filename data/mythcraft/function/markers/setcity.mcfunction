#Remove City tag
tag @e[type=marker,tag=spawnmarker,distance=..20] remove City1
tag @e[type=marker,tag=spawnmarker,distance=..20] remove City2
tag @e[type=marker,tag=spawnmarker,distance=..20] remove City3
tag @e[type=marker,tag=spawnmarker,distance=..20] remove City4
tag @e[type=marker,tag=spawnmarker,distance=..20] remove City5
tag @e[type=marker,tag=spawnmarker,distance=..20] remove City6
tag @e[type=marker,tag=spawnmarker,distance=..20] remove City7
tag @e[type=marker,tag=spawnmarker,distance=..20] remove Attack
tag @e[type=marker,tag=spawnmarker,distance=..20] remove Defense
tag @e[type=marker,tag=spawnmarker,distance=..20] remove Magic
tag @e[type=marker,tag=spawnmarker,distance=..20] remove Special
#Add City tag
execute as @s[tag=setmarker_city1] run tag @e[type=marker,tag=spawnmarker,distance=..20] add City1
execute as @s[tag=setmarker_city2] run tag @e[type=marker,tag=spawnmarker,distance=..20] add City2
execute as @s[tag=setmarker_city3] run tag @e[type=marker,tag=spawnmarker,distance=..20] add City3
execute as @s[tag=setmarker_city4] run tag @e[type=marker,tag=spawnmarker,distance=..20] add City4
execute as @s[tag=setmarker_city5] run tag @e[type=marker,tag=spawnmarker,distance=..20] add City5
execute as @s[tag=setmarker_city6] run tag @e[type=marker,tag=spawnmarker,distance=..20] add City6
execute as @s[tag=setmarker_city7] run tag @e[type=marker,tag=spawnmarker,distance=..20] add City7
#Add Location tag
execute as @s[tag=setmarker_attack] run tag @e[type=marker,tag=spawnmarker,distance=..20] add Attack
execute as @s[tag=setmarker_defense] run tag @e[type=marker,tag=spawnmarker,distance=..20] add Defense
execute as @s[tag=setmarker_magic] run tag @e[type=marker,tag=spawnmarker,distance=..20] add Magic
execute as @s[tag=setmarker_special] run tag @e[type=marker,tag=spawnmarker,distance=..20] add Special
#Visual Notif
tellraw @a[distance=..20] [{color:"blue",text:"[Mythcraft Wars Admin] All spawn markers within 20 blocks have had their city/location (re)assigned."}]
execute at @e[type=marker,tag=spawnmarker,distance=..20] run particle block_marker{block_state:"lime_concrete"} ~ ~1.5 ~ 0 0 0 0 1 force
#Kill egg marker
kill @s