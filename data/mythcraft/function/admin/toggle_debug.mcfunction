# Toggle debug mode tag and reopen admin menu
scoreboard players set @s adminAction 0

# Use mathCounter to capture state before toggling
scoreboard players set @s mathCounter 0
execute if entity @s[tag=debugMode] run scoreboard players set @s mathCounter 1
execute if score @s mathCounter matches 1 run tag @s remove debugMode
execute if score @s mathCounter matches 0 run tag @s add debugMode

function mythcraft:admin/open
