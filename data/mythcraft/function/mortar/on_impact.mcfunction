# Summon field marker at impact point
execute at @s run summon marker ~ ~ ~ {Tags:["mortarField","newMortarField"]}

# Copy team tag to field
execute as @s[tag=Team1] run tag @e[tag=newMortarField,limit=1] add Team1
execute as @s[tag=Team2] run tag @e[tag=newMortarField,limit=1] add Team2

# Copy character level for field scaling
scoreboard players operation @e[tag=newMortarField,limit=1] mortarCharLevel = @s mortarCharLevel

# Initialize field lifetime (200 ticks = 10 seconds)
scoreboard players set @e[tag=newMortarField,limit=1] mortarFieldLife 200

# Remove new field tag
tag @e[tag=newMortarField] remove newMortarField

# Sound effect at impact
execute at @s run playsound minecraft:entity.firework_rocket.blast master @a ~ ~ ~ 2 1

# Kill the tracker
kill @s
