# Quest history dialog with dynamically-built body from recursive loop
# Macro params: completedQuests, totalQuests, historyBody
$dialog show @s {type:"minecraft:multi_action",title:"Quest History ($(completedQuests)/$(totalQuests) completed)",pause:true,body:{type:"minecraft:plain_message",contents:$(historyBody)},actions:[{label:{text:"Back"},width:150,action:{type:"minecraft:run_command",command:"trigger openMenu set 1"}}]}
