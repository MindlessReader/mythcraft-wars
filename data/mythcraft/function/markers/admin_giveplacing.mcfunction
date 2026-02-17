# Regular Troop Spawn Marker
give @s pillager_spawn_egg[custom_name=[{italic:false,text:"Spawn Marker: "},{bold:true,color:"green",text:"Regular Troop"}],entity_data={id:"minecraft:marker",Tags:["spawnmarker","spawnmarker_regular"]}] 1
# Boss Troop Spawn Marker
give @s creeper_spawn_egg[custom_name=[{italic:false,text:"Spawn Marker: "},{bold:true,color:"red",text:"Boss Troop"}],entity_data={id:"minecraft:marker",Tags:["spawnmarker","spawnmarker_boss"]}] 1
#Visual Notif
tellraw @s [{color:"blue",text:"[Mythcraft Wars Admin] Troop spawner markers given. Place regular markers (green) = troopCap count, boss markers (red) = bossCap count per city."}]
