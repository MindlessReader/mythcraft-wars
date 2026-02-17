# Announce raid boss victory
# Params: $(teamName), $(teamColor), $(bossDisplayName)

tellraw @a [{bold:true,color:"dark_purple",text:"=== RAID BOSS DEFEATED ==="}]
$tellraw @a [{color:"$(teamColor)",text:"$(teamName)",bold:true},{text:" have slain ",color:"white",bold:false},{text:"$(bossDisplayName)",color:"dark_purple",bold:true},{text:"!",color:"white",bold:false}]
tellraw @a [{text:"Rewards:",color:"gold"}]
function mythcraft:raidboss/helpers/display_rewards
tellraw @a [{bold:true,color:"dark_purple",text:"========================="}]

title @a title [{bold:true,color:"gold",text:"RAID BOSS DEFEATED"}]
$title @a subtitle [{color:"$(teamColor)",text:"$(teamName)",bold:true},{text:" claim victory!",color:"white",bold:false}]
execute as @a at @s run playsound ui.toast.challenge_complete master @s ~ ~ ~
