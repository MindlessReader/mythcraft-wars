# Routes back to the correct editor after teleport editing
# Reads mythcraft:nav teleportBack to determine destination
execute if data storage mythcraft:nav teleportBack{type:"city"} run function mythcraft:config/teleport_nav_back_city with storage mythcraft:nav teleportBack
execute if data storage mythcraft:nav teleportBack{type:"skill"} run function mythcraft:config/teleport_nav_back_skill with storage mythcraft:nav teleportBack