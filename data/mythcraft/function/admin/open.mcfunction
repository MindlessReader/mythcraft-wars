# Admin menu - requires admin tag (gated in tick.mcfunction)
scoreboard players set @s openMenu 0

# Resolve toggle states for button labels
data modify storage mythcraft:temp debugLabel set value "Debug: OFF"
data modify storage mythcraft:temp debugColor set value "gray"
execute if entity @s[tag=debugMode] run data modify storage mythcraft:temp debugLabel set value "Debug: ON"
execute if entity @s[tag=debugMode] run data modify storage mythcraft:temp debugColor set value "green"

data modify storage mythcraft:temp godLabel set value "God Mode: OFF"
data modify storage mythcraft:temp godColor set value "gray"
execute if entity @s[tag=godMode] run data modify storage mythcraft:temp godLabel set value "God Mode: ON"
execute if entity @s[tag=godMode] run data modify storage mythcraft:temp godColor set value "green"

function mythcraft:admin/show with storage mythcraft:temp
