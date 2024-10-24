scoreboard players remove @a[scores={BuffResistance=1..}] BuffResistance 5
scoreboard players remove @a[scores={BuffSpeed=1..}] BuffSpeed 5
scoreboard players remove @a[scores={BuffStrength=1..}] BuffStrength 5
scoreboard players remove @a[scores={BuffHealthBoost=1..}] BuffHealthBoost 5

function mythcraft:applybuffs

schedule function mythcraft:quests/buffloop 5s