execute at @e[type=marker,tag=spawnmarker,distance=..20] run particle block_marker{block_state:"red_concrete"} ~ ~1.5 ~ 0 0 0 0 1 force
kill @e[type=marker,tag=spawnmarker,distance=..20]
tellraw @a[distance=..20] [{color:"blue",text:"[Mythcraft Wars Admin] Killed all spawn markers within 20 blocks."}]