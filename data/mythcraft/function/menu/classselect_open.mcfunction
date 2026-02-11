# Gather current class info and show class selector dialog

# Reset trigger
scoreboard players set @s openMenu 0

# Get current class name for display
execute if score @s playerClass matches 1 run data modify storage mythcraft:temp className set value "Warrior"
execute if score @s playerClass matches 2 run data modify storage mythcraft:temp className set value "Assassin"
execute if score @s playerClass matches 3 run data modify storage mythcraft:temp className set value "Bastion"
execute unless score @s playerClass matches 1..3 run data modify storage mythcraft:temp className set value "None"

function mythcraft:menu/classselect_show with storage mythcraft:temp
