# level up, called when xp threshold is met. parameter $(locationName)
$execute as @s[team=Druids] run scoreboard players add Druids level$(locationName) 1
$execute as @s[team=Royals] run scoreboard players add Royals level$(locationName) 1

# announce level up
$execute as @s[team=Druids] run tellraw @a [{"bold":false,"color":"green","text":"Druids"},{"color":"yellow","text":" have leveled up the "},{"bold":false,"color":"white","text":"$(locationName)"},{"color":"yellow","text":" skill to level "},{"color":"dark_purple","score":{"name":"Druids","objective":"level$(locationName)"}},{"color":"yellow","text":"!"}]
$execute as @s[team=Royals] run tellraw @a [{"bold":false,"color":"blue","text":"Royals"},{"color":"yellow","text":" have leveled up the "},{"bold":false,"color":"white","text":"$(locationName)"},{"color":"yellow","text":" skill to level "},{"color":"dark_purple","score":{"name":"Royals","objective":"level$(locationName)"}},{"color":"yellow","text":"!"}]


# call function to update the kit of all players on the team
execute as @s[team=Druids] as @a[team=Druids] run function mythcraft:leveling/levelequipment
execute as @s[team=Royals] as @a[team=Royals] run function mythcraft:leveling/levelequipment
