# level up, called when xp threshold is met. parameter $(locationName)
$execute as @s[team=Druids] run scoreboard players add Druids level$(locationName) 1
$execute as @s[team=Royals] run scoreboard players add Royals level$(locationName) 1

# call function to update the kit of all players on the team. maybe just call rekit
execute as @s[team=Druids] as @a[team=Druids] run function mythcraft:rekit
execute as @s[team=Royals] as @a[team=Royals] run function mythcraft:rekit
