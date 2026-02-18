# Confirm before deleting spawn markers within 20 blocks
scoreboard players set @s adminAction 0
dialog show @s {type:"minecraft:multi_action",title:"Delete Nearby Markers",pause:true,body:{type:"minecraft:plain_message",contents:{text:"This will permanently kill all spawn markers within 20 blocks. Are you sure?",color:"red"}},columns:2,actions:[{label:{text:"Yes, Delete",color:"red"},width:150,action:{type:"minecraft:run_command",command:"trigger adminAction set 10"}},{label:{text:"Cancel"},width:150,action:{type:"minecraft:run_command",command:"trigger adminAction set 0"}}]}
