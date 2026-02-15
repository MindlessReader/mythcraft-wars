# Shield use handler — fires every tick shield is raised
# Always revoke for reuse
advancement revoke @s only mythcraft:item/shield_use
# Only Bastion (class 3)
execute unless score @s playerClass matches 3 run return 0
# Mark blocking this tick
scoreboard players set @s _shieldTick 1
# Start parry window on first tick of new block (if off cooldown)
execute if score @s _wasBlocking matches 0 if score @s parryCooldown matches 0 run scoreboard players set @s parryWindow 10
