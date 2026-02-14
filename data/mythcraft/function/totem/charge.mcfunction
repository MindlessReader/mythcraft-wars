# Add charge to assassin totem (macro: amount)
# Save old charge for threshold detection
scoreboard players operation @s _totemDmg = @s totemCharge
$scoreboard players add @s totemCharge $(amount)

# Clamp charge to max for current character level
execute if score @s characterLevel matches ..1 if score @s totemCharge matches 65.. run scoreboard players set @s totemCharge 64
execute if score @s characterLevel matches 2 if score @s totemCharge matches 49.. run scoreboard players set @s totemCharge 48
execute if score @s characterLevel matches 3 if score @s totemCharge matches 37.. run scoreboard players set @s totemCharge 36
execute if score @s characterLevel matches 4 if score @s totemCharge matches 25.. run scoreboard players set @s totemCharge 24
execute if score @s characterLevel matches 5.. if score @s totemCharge matches 17.. run scoreboard players set @s totemCharge 16

# Play sound only when crossing 25/50/75/100% thresholds (_totemDmg = old charge)
# Level 1 (max 64): 16, 32, 48, 64
execute if score @s characterLevel matches ..1 if score @s _totemDmg matches ..15 if score @s totemCharge matches 16.. run playsound minecraft:block.respawn_anchor.charge master @s ~ ~ ~ 0.5 1.5
execute if score @s characterLevel matches ..1 if score @s _totemDmg matches ..31 if score @s totemCharge matches 32.. run playsound minecraft:block.respawn_anchor.charge master @s ~ ~ ~ 0.5 1.5
execute if score @s characterLevel matches ..1 if score @s _totemDmg matches ..47 if score @s totemCharge matches 48.. run playsound minecraft:block.respawn_anchor.charge master @s ~ ~ ~ 0.5 1.5
execute if score @s characterLevel matches ..1 if score @s _totemDmg matches ..63 if score @s totemCharge matches 64.. run playsound minecraft:block.respawn_anchor.charge master @s ~ ~ ~ 0.5 1.5
# Level 2 (max 48): 12, 24, 36, 48
execute if score @s characterLevel matches 2 if score @s _totemDmg matches ..11 if score @s totemCharge matches 12.. run playsound minecraft:block.respawn_anchor.charge master @s ~ ~ ~ 0.5 1.5
execute if score @s characterLevel matches 2 if score @s _totemDmg matches ..23 if score @s totemCharge matches 24.. run playsound minecraft:block.respawn_anchor.charge master @s ~ ~ ~ 0.5 1.5
execute if score @s characterLevel matches 2 if score @s _totemDmg matches ..35 if score @s totemCharge matches 36.. run playsound minecraft:block.respawn_anchor.charge master @s ~ ~ ~ 0.5 1.5
execute if score @s characterLevel matches 2 if score @s _totemDmg matches ..47 if score @s totemCharge matches 48.. run playsound minecraft:block.respawn_anchor.charge master @s ~ ~ ~ 0.5 1.5
# Level 3 (max 36): 9, 18, 27, 36
execute if score @s characterLevel matches 3 if score @s _totemDmg matches ..8 if score @s totemCharge matches 9.. run playsound minecraft:block.respawn_anchor.charge master @s ~ ~ ~ 0.5 1.5
execute if score @s characterLevel matches 3 if score @s _totemDmg matches ..17 if score @s totemCharge matches 18.. run playsound minecraft:block.respawn_anchor.charge master @s ~ ~ ~ 0.5 1.5
execute if score @s characterLevel matches 3 if score @s _totemDmg matches ..26 if score @s totemCharge matches 27.. run playsound minecraft:block.respawn_anchor.charge master @s ~ ~ ~ 0.5 1.5
execute if score @s characterLevel matches 3 if score @s _totemDmg matches ..35 if score @s totemCharge matches 36.. run playsound minecraft:block.respawn_anchor.charge master @s ~ ~ ~ 0.5 1.5
# Level 4 (max 24): 6, 12, 18, 24
execute if score @s characterLevel matches 4 if score @s _totemDmg matches ..5 if score @s totemCharge matches 6.. run playsound minecraft:block.respawn_anchor.charge master @s ~ ~ ~ 0.5 1.5
execute if score @s characterLevel matches 4 if score @s _totemDmg matches ..11 if score @s totemCharge matches 12.. run playsound minecraft:block.respawn_anchor.charge master @s ~ ~ ~ 0.5 1.5
execute if score @s characterLevel matches 4 if score @s _totemDmg matches ..17 if score @s totemCharge matches 18.. run playsound minecraft:block.respawn_anchor.charge master @s ~ ~ ~ 0.5 1.5
execute if score @s characterLevel matches 4 if score @s _totemDmg matches ..23 if score @s totemCharge matches 24.. run playsound minecraft:block.respawn_anchor.charge master @s ~ ~ ~ 0.5 1.5
# Level 5 (max 16): 4, 8, 12, 16
execute if score @s characterLevel matches 5.. if score @s _totemDmg matches ..3 if score @s totemCharge matches 4.. run playsound minecraft:block.respawn_anchor.charge master @s ~ ~ ~ 0.5 1.5
execute if score @s characterLevel matches 5.. if score @s _totemDmg matches ..7 if score @s totemCharge matches 8.. run playsound minecraft:block.respawn_anchor.charge master @s ~ ~ ~ 0.5 1.5
execute if score @s characterLevel matches 5.. if score @s _totemDmg matches ..11 if score @s totemCharge matches 12.. run playsound minecraft:block.respawn_anchor.charge master @s ~ ~ ~ 0.5 1.5
execute if score @s characterLevel matches 5.. if score @s _totemDmg matches ..15 if score @s totemCharge matches 16.. run playsound minecraft:block.respawn_anchor.charge master @s ~ ~ ~ 0.5 1.5

# Sync totem display (must run after threshold checks since update overwrites _totemDmg)
function mythcraft:totem/update
