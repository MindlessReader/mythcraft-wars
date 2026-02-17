# Migrate old type-specific spawn markers to new tier-based system
# Run once by admin in existing worlds — adds spawnmarker_regular/spawnmarker_boss tags
# Old type-specific tags remain as harmless dead weight

# Regular troops: pillager, vindicator, zombie, skeleton, witch
tag @e[tag=spawnmarker_pillager] add spawnmarker_regular
tag @e[tag=spawnmarker_vindicator] add spawnmarker_regular
tag @e[tag=spawnmarker_zombie] add spawnmarker_regular
tag @e[tag=spawnmarker_skeleton] add spawnmarker_regular
tag @e[tag=spawnmarker_witch] add spawnmarker_regular

# Boss troops: bosszombie, bossskeleton, bosswitch, blaze, breeze, illusioner
tag @e[tag=spawnmarker_bosszombie] add spawnmarker_boss
tag @e[tag=spawnmarker_bossskeleton] add spawnmarker_boss
tag @e[tag=spawnmarker_bosswitch] add spawnmarker_boss
tag @e[tag=spawnmarker_blaze] add spawnmarker_boss
tag @e[tag=spawnmarker_breeze] add spawnmarker_boss
tag @e[tag=spawnmarker_illusioner] add spawnmarker_boss

tellraw @s [{color:"green",text:"[Mythcraft Wars] Marker migration complete. Old typed markers now have tier tags (spawnmarker_regular/spawnmarker_boss)."}]
