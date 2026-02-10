# Re-applies all display settings from current config values
# Run this after editing config to update bossbars, sidebar, and team colors

# Re-apply team colors
function mythcraft:setup/configteam with storage mythcraft:config teams.Team1
function mythcraft:setup/configteam with storage mythcraft:config teams.Team2
team modify Unaligned color yellow

# Re-apply bossbar
data modify storage mythcraft:temp team1Name set from storage mythcraft:config teams.Team1.name
data modify storage mythcraft:temp team1Color set from storage mythcraft:config teams.Team1.color
data modify storage mythcraft:temp team2Name set from storage mythcraft:config teams.Team2.name
data modify storage mythcraft:temp team2Color set from storage mythcraft:config teams.Team2.color
function mythcraft:setup/bossbar with storage mythcraft:temp

# Reset and re-add sidebar entries (removes old names, adds current ones)
scoreboard players reset * display
function mythcraft:setup/sidebar_city {cityId:City1, displayScore:-2}
function mythcraft:setup/sidebar_city {cityId:City2, displayScore:-3}
function mythcraft:setup/sidebar_city {cityId:City3, displayScore:-4}
function mythcraft:setup/sidebar_city {cityId:City4, displayScore:-5}
function mythcraft:setup/sidebar_city {cityId:City5, displayScore:-6}
function mythcraft:setup/sidebar_city {cityId:City6, displayScore:-7}
function mythcraft:setup/sidebar_city {cityId:City7, displayScore:-8}

# Re-open config menu
function mythcraft:config/open
