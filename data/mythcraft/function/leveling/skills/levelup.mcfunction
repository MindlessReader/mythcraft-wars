# level up, called when xp threshold is met. parameter $(locationName)
$execute as @s[team=Druids] run scoreboard players add Druids level$(locationName) 1
$execute as @s[team=Royals] run scoreboard players add Royals level$(locationName) 1

# announce level up
$execute as @s[team=Druids] run tellraw @a [{bold:false,color:"green",text:"Druids"},{color:"#FFD700",text:" have leveled up the "},{bold:false,color:"white",text:"$(locationName)"},{color:"#FFD700",text:" skill to level "},{color:"#663399",score:{name:"Druids",objective:"level$(locationName)"}},{color:"#FFD700",text:" ⚡"}]
$execute as @s[team=Royals] run tellraw @a [{bold:false,color:"blue",text:"Royals"},{color:"#FFD700",text:" have leveled up the "},{bold:false,color:"white",text:"$(locationName)"},{color:"#FFD700",text:" skill to level "},{color:"#663399",score:{name:"Royals",objective:"level$(locationName)"}},{color:"#FFD700",text:" ⚡"}]
execute at @s[team=Druids] as @a[team=Druids] run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 100 0.5
execute at @s[team=Royals] as @a[team=Royals] run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 100 0.5
execute at @s[team=Druids] as @a[team=Druids] run playsound minecraft:block.smithing_table.use master @s ~ ~ ~ 100 0.99
execute at @s[team=Royals] as @a[team=Royals] run playsound minecraft:block.smithing_table.use master @s ~ ~ ~ 100 0.99

# call function to update the kit of all players on the team
execute as @s[team=Druids] as @a[team=Druids] run function mythcraft:leveling/levelequipment
execute as @s[team=Royals] as @a[team=Royals] run function mythcraft:leveling/levelequipment
