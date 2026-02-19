# Apply fireball burn to current entity (max-duration: won't shorten existing burn)
# Called with {ticks:N, team:"_fbTeamN"}
# Gate on Health field — only living entities can burn (excludes markers, area_effect_clouds, etc.)
execute if data entity @s Health run tag @s add _fireballBurn
# Only update team/timer if new burn is longer than existing
$execute if entity @s[tag=_fireballBurn] unless score @s _fbBurnTimer matches $(ticks).. run tag @s remove _fbTeam1
$execute if entity @s[tag=_fireballBurn] unless score @s _fbBurnTimer matches $(ticks).. run tag @s remove _fbTeam2
$execute if entity @s[tag=_fireballBurn] unless score @s _fbBurnTimer matches $(ticks).. run tag @s add $(team)
$execute if entity @s[tag=_fireballBurn] unless score @s _fbBurnTimer matches $(ticks).. run scoreboard players set @s _fbBurnTimer $(ticks)
$execute if entity @s[tag=_fireballBurn] unless score @s _fbBurnTimer matches $(ticks).. run scoreboard players set @s _fbSubTick 0
