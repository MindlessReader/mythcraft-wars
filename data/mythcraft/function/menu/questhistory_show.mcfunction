# Quest history dialog
# Macro params: $(q1) through $(q10)
$dialog show @s {type:"minecraft:multi_action",title:"Quest History",pause:true,body:{type:"minecraft:plain_message",contents:" 1. $(q1)\n 2. $(q2)\n 3. $(q3)\n 4. $(q4)\n 5. $(q5)\n 6. $(q6)\n 7. $(q7)\n 8. $(q8)\n 9. $(q9)\n10. $(q10)"},actions:[{label:{text:"Back"},width:150,action:{type:"minecraft:run_command",command:"trigger openMenu set 1"}}]}
