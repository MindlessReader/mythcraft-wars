# Migration: add bossPool and bossCap to skill locations for existing worlds
data modify storage mythcraft:config skillLocations.Attack.bossCap set value 0
data modify storage mythcraft:config skillLocations.Attack.bossPool set value ["bosszombie","bossskeleton","bosswitch","blaze","breeze","illusioner"]
data modify storage mythcraft:config skillLocations.Defense.bossCap set value 0
data modify storage mythcraft:config skillLocations.Defense.bossPool set value ["bosszombie","bossskeleton","bosswitch","blaze","breeze","illusioner"]
data modify storage mythcraft:config skillLocations.Magic.bossCap set value 0
data modify storage mythcraft:config skillLocations.Magic.bossPool set value ["bosszombie","bossskeleton","bosswitch","blaze","breeze","illusioner"]
data modify storage mythcraft:config skillLocations.Special.bossCap set value 0
data modify storage mythcraft:config skillLocations.Special.bossPool set value ["bosszombie","bossskeleton","bosswitch","blaze","breeze","illusioner"]
