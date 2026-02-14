# Sync totem display (durability bar + death_protection) from totemCharge scoreboard
# Called after every charge change, on rekit, and on level-up

# Determine max charge and calculate damage (damage = max - charge)
# Level 1: max=64, Level 2: max=48, Level 3: max=36, Level 4: max=24, Level 5: max=16
execute if score @s characterLevel matches ..1 run scoreboard players set @s _totemMax 64
execute if score @s characterLevel matches 2 run scoreboard players set @s _totemMax 48
execute if score @s characterLevel matches 3 run scoreboard players set @s _totemMax 36
execute if score @s characterLevel matches 4 run scoreboard players set @s _totemMax 24
execute if score @s characterLevel matches 5.. run scoreboard players set @s _totemMax 16

# Clamp charge to max (in case level changed and max decreased)
execute if score @s totemCharge > @s _totemMax run scoreboard players operation @s totemCharge = @s _totemMax

# Calculate damage = max - charge
scoreboard players operation @s _totemDmg = @s _totemMax
scoreboard players operation @s _totemDmg -= @s totemCharge

# Store values to storage for macro
execute store result storage mythcraft:temp totemMaxDamage int 1 run scoreboard players get @s _totemMax
execute store result storage mythcraft:temp totemDamage int 1 run scoreboard players get @s _totemDmg

# Apply max_damage and damage to totem
function mythcraft:totem/apply with storage mythcraft:temp

# Toggle death_protection based on whether fully charged (damage = 0)
execute if score @s _totemDmg matches 0 run item modify entity @s weapon.offhand mythcraft:totem_charged
execute if score @s _totemDmg matches 1.. run item modify entity @s weapon.offhand mythcraft:totem_uncharged
