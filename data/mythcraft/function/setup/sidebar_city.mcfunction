# Sets a city's display name on the sidebar scoreboard
# Parameters: $(cityId), $(displayScore)
# Reads display name from mythcraft:config storage, then applies it
$data modify storage mythcraft:temp sidebarName set from storage mythcraft:config cities.$(cityId).name
$data modify storage mythcraft:temp sidebarScore set value $(displayScore)
function mythcraft:setup/sidebar_apply with storage mythcraft:temp
