execute as @e[tag=cityTroop,team=Team1] unless entity @a[team=Team2,distance=..20] run effect give @s slowness infinite 9 true
execute as @e[tag=cityTroop,team=Team2] unless entity @a[team=Team1,distance=..20] run effect give @s slowness infinite 9 true
execute as @e[tag=cityTroop,team=Unaligned] unless entity @a[distance=..20] run effect give @s slowness infinite 9 true

schedule function mythcraft:deactivationloop 5s