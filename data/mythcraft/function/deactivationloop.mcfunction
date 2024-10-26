execute as @e[tag=cityTroop,team=Druids] unless entity @a[team=Royals,distance=..20] run effect give @s slowness infinite 9 true
execute as @e[tag=cityTroop,team=Royals] unless entity @a[team=Druids,distance=..20] run effect give @s slowness infinite 9 true
execute as @e[tag=cityTroop,team=Unaligned] unless entity @a[distance=..20] run effect give @s slowness infinite 9 true

schedule function mythcraft:deactivationloop 5s