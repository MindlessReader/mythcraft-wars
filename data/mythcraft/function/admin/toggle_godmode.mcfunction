# Toggle god mode tag and reopen admin menu
scoreboard players set @s adminAction 0

# Use mathCounter to capture state before toggling
scoreboard players set @s mathCounter 0
execute if entity @s[tag=godMode] run scoreboard players set @s mathCounter 1
execute if score @s mathCounter matches 1 run tag @s remove godMode
execute if score @s mathCounter matches 0 run tag @s add godMode

function mythcraft:admin/open
