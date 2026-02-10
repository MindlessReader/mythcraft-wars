$title @a[team=$(teamName)] title [{italic:true,text:"Quest",color:"light_purple"},{italic:false,color:"dark_green",text:" ☮ "},{italic:true,text:"Won",color:"light_purple"}]
$title @a[team=!$(teamName),team=!Unaligned] title [{italic:true,text:"Quest",color:"light_purple"},{italic:false,color:"dark_red",text:" 🗡 "},{italic:true,text:"Lost",color:"light_purple"}]

# resolve team display name for announcement
$data modify storage mythcraft:temp teamDisplayName set from storage mythcraft:config teams.$(teamName).name
$data modify storage mythcraft:temp teamColor set from storage mythcraft:config teams.$(teamName).color
function mythcraft:quests/quest_winteam_announce with storage mythcraft:temp
