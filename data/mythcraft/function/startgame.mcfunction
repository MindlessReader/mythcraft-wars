title @a title {"bold":true,"color":"yellow","text":"Game Start"}
title @a subtitle {"color":"#663399","text":"The Mythcraft 10 Year Anniversary Event has begun!"}
tellraw @a [{"bold":false,"color":"#663399","text":"The Mythcraft 10 Year Anniversary Event has begun!\nQuests begin in 5 minutes."}]
execute as @a at @s run playsound ui.toast.challenge_complete master @s ~ ~ ~

schedule function mythcraft:quests/startquest 300s

function mythcraft:respawn/respawnchecker
function mythcraft:quests/buffloop