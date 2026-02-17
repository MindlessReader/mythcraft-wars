# Increment troop count for skill locations that are below cap
# Runs every game.skillRegenInterval seconds — no quiet period required
# Respawn pass handles spawning the actual entities

# Regulars
execute unless score Attack troopCount = Attack troopCap if entity @a[tag=debugMode] run say [DEBUG] Skill regen: Attack regular +1
execute unless score Attack troopCount = Attack troopCap run scoreboard players add Attack troopCount 1
execute unless score Defense troopCount = Defense troopCap if entity @a[tag=debugMode] run say [DEBUG] Skill regen: Defense regular +1
execute unless score Defense troopCount = Defense troopCap run scoreboard players add Defense troopCount 1
execute unless score Magic troopCount = Magic troopCap if entity @a[tag=debugMode] run say [DEBUG] Skill regen: Magic regular +1
execute unless score Magic troopCount = Magic troopCap run scoreboard players add Magic troopCount 1
execute unless score Special troopCount = Special troopCap if entity @a[tag=debugMode] run say [DEBUG] Skill regen: Special regular +1
execute unless score Special troopCount = Special troopCap run scoreboard players add Special troopCount 1

# Bosses
execute unless score Attack bossCount = Attack bossCap if entity @a[tag=debugMode] run say [DEBUG] Skill regen: Attack boss +1
execute unless score Attack bossCount = Attack bossCap run scoreboard players add Attack bossCount 1
execute unless score Defense bossCount = Defense bossCap if entity @a[tag=debugMode] run say [DEBUG] Skill regen: Defense boss +1
execute unless score Defense bossCount = Defense bossCap run scoreboard players add Defense bossCount 1
execute unless score Magic bossCount = Magic bossCap if entity @a[tag=debugMode] run say [DEBUG] Skill regen: Magic boss +1
execute unless score Magic bossCount = Magic bossCap run scoreboard players add Magic bossCount 1
execute unless score Special bossCount = Special bossCap if entity @a[tag=debugMode] run say [DEBUG] Skill regen: Special boss +1
execute unless score Special bossCount = Special bossCap run scoreboard players add Special bossCount 1

# Reschedule
data modify storage mythcraft:temp duration set from storage mythcraft:config game.skillRegenInterval
function mythcraft:schedule/regen_skill_tick with storage mythcraft:temp
