# Shield block handler — fires when player blocks damage with shield
# Always revoke for reuse
advancement revoke @s only mythcraft:item/shield_block
# Only Bastion (class 3)
execute unless score @s playerClass matches 3 run return 0
# Skip if on cooldown
execute if score @s parryCooldown matches 1.. run return 0
# Perfect parry if within timing window, otherwise normal parry
execute if score @s parryWindow matches 1.. run function mythcraft:parry/perfect
execute unless score @s parryWindow matches 1.. run function mythcraft:parry/normal
# Set shared cooldown (50 ticks = 2.5 seconds)
scoreboard players set @s parryCooldown 50
