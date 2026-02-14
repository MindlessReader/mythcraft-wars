# level up effects, called when level changed. parameter $(locationName)
# Note: level is already set by checklevel.mcfunction, this function only handles effects

# resolve team display names for announcement
$data modify storage mythcraft:temp locationName set value "$(locationName)"
data modify storage mythcraft:temp team1Name set from storage mythcraft:config teams.Team1.name
data modify storage mythcraft:temp team1Color set from storage mythcraft:config teams.Team1.color
data modify storage mythcraft:temp team2Name set from storage mythcraft:config teams.Team2.name
data modify storage mythcraft:temp team2Color set from storage mythcraft:config teams.Team2.color
function mythcraft:leveling/skills/levelup_announce with storage mythcraft:temp

execute at @s[team=Team1] as @a[team=Team1] run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 100 0.5
execute at @s[team=Team2] as @a[team=Team2] run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 100 0.5
execute at @s[team=Team1] as @a[team=Team1] run playsound minecraft:block.smithing_table.use master @s ~ ~ ~ 100 0.99
execute at @s[team=Team2] as @a[team=Team2] run playsound minecraft:block.smithing_table.use master @s ~ ~ ~ 100 0.99

# call function to update the kit of all players on the team
execute as @s[team=Team1] as @a[team=Team1] run function mythcraft:leveling/levelequipment
execute as @s[team=Team2] as @a[team=Team2] run function mythcraft:leveling/levelequipment
