# Validate that an assassin holding a charged totem in mainhand actually has full charge
# Strips death_protection if charge doesn't match max for current level
execute if score @s characterLevel matches ..1 unless score @s totemCharge matches 64 run item modify entity @s weapon.mainhand mythcraft:totem_uncharged
execute if score @s characterLevel matches 2 unless score @s totemCharge matches 48 run item modify entity @s weapon.mainhand mythcraft:totem_uncharged
execute if score @s characterLevel matches 3 unless score @s totemCharge matches 36 run item modify entity @s weapon.mainhand mythcraft:totem_uncharged
execute if score @s characterLevel matches 4 unless score @s totemCharge matches 24 run item modify entity @s weapon.mainhand mythcraft:totem_uncharged
execute if score @s characterLevel matches 5.. unless score @s totemCharge matches 16 run item modify entity @s weapon.mainhand mythcraft:totem_uncharged
