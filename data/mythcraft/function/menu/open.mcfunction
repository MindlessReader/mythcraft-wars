# Gather all game state into mythcraft:temp, then show the main player menu
# Called when player shift+right-clicks compass, or via trigger openMenu set 1

# Reset trigger
scoreboard players set @s openMenu 0

# Determine player team
execute if entity @s[team=Team1] run data modify storage mythcraft:temp teamId set value "Team1"
execute if entity @s[team=Team2] run data modify storage mythcraft:temp teamId set value "Team2"

# Get team skill levels, XP, and thresholds
execute if entity @s[team=Team1] run function mythcraft:menu/helpers/gather_team_skills {teamId:"Team1"}
execute if entity @s[team=Team2] run function mythcraft:menu/helpers/gather_team_skills {teamId:"Team2"}
# Defaults for unaligned players
execute unless entity @s[team=Team1] unless entity @s[team=Team2] run data modify storage mythcraft:temp lvlAttack set value 0
execute unless entity @s[team=Team1] unless entity @s[team=Team2] run data modify storage mythcraft:temp xpAttack set value 0
execute unless entity @s[team=Team1] unless entity @s[team=Team2] run data modify storage mythcraft:temp threshAttack set value "N/A"
execute unless entity @s[team=Team1] unless entity @s[team=Team2] run data modify storage mythcraft:temp lvlDefense set value 0
execute unless entity @s[team=Team1] unless entity @s[team=Team2] run data modify storage mythcraft:temp xpDefense set value 0
execute unless entity @s[team=Team1] unless entity @s[team=Team2] run data modify storage mythcraft:temp threshDefense set value "N/A"
execute unless entity @s[team=Team1] unless entity @s[team=Team2] run data modify storage mythcraft:temp lvlMagic set value 0
execute unless entity @s[team=Team1] unless entity @s[team=Team2] run data modify storage mythcraft:temp xpMagic set value 0
execute unless entity @s[team=Team1] unless entity @s[team=Team2] run data modify storage mythcraft:temp threshMagic set value "N/A"
execute unless entity @s[team=Team1] unless entity @s[team=Team2] run data modify storage mythcraft:temp lvlSpecial set value 0
execute unless entity @s[team=Team1] unless entity @s[team=Team2] run data modify storage mythcraft:temp xpSpecial set value 0
execute unless entity @s[team=Team1] unless entity @s[team=Team2] run data modify storage mythcraft:temp threshSpecial set value "N/A"

# Get player class name
execute if score @s playerClass matches 1 run data modify storage mythcraft:temp className set value "Warrior"
execute if score @s playerClass matches 2 run data modify storage mythcraft:temp className set value "Assassin"
execute if score @s playerClass matches 3 run data modify storage mythcraft:temp className set value "Bastion"
execute unless score @s playerClass matches 1..3 run data modify storage mythcraft:temp className set value "None"

# Get character level and XP
execute store result storage mythcraft:temp charLvl int 1 run scoreboard players get @s characterLevel
execute store result storage mythcraft:temp charXP int 1 run scoreboard players get @s characterXP

# Get character XP threshold for next level
execute if score @s characterLevel matches 0 store result storage mythcraft:temp charThresh int 1 run scoreboard players get CharLvl1 characterXPThresholds
execute if score @s characterLevel matches 1 store result storage mythcraft:temp charThresh int 1 run scoreboard players get CharLvl2 characterXPThresholds
execute if score @s characterLevel matches 2 store result storage mythcraft:temp charThresh int 1 run scoreboard players get CharLvl3 characterXPThresholds
execute if score @s characterLevel matches 3 store result storage mythcraft:temp charThresh int 1 run scoreboard players get CharLvl4 characterXPThresholds
execute if score @s characterLevel matches 4 store result storage mythcraft:temp charThresh int 1 run scoreboard players get CharLvl5 characterXPThresholds
execute if score @s characterLevel matches 5 run data modify storage mythcraft:temp charThresh set value "MAX"

# Get current quest info (or placeholder if no active quest)
data modify storage mythcraft:temp questType set value "---"
data modify storage mythcraft:temp questLocation set value "---"
data modify storage mythcraft:temp questReward set value "---"
data modify storage mythcraft:temp questNum set value 0
execute if score QuestTracker questWinner matches 0 run data modify storage mythcraft:temp questType set from storage mythcraft:quest typeText
execute if score QuestTracker questWinner matches 0 run data modify storage mythcraft:temp questLocation set from storage mythcraft:quest locationText
execute if score QuestTracker questWinner matches 0 run data modify storage mythcraft:temp questReward set from storage mythcraft:quest rewardText

# Compute quest number: 11 - questsRemaining
scoreboard players set @s mathCounter 11
scoreboard players operation @s mathCounter -= QuestTracker questsRemaining
execute store result storage mythcraft:temp questNum int 1 run scoreboard players get @s mathCounter

# Get city names for teleport button labels
data modify storage mythcraft:temp city1 set from storage mythcraft:config cities.City1.name
data modify storage mythcraft:temp city2 set from storage mythcraft:config cities.City2.name
data modify storage mythcraft:temp city3 set from storage mythcraft:config cities.City3.name
data modify storage mythcraft:temp city4 set from storage mythcraft:config cities.City4.name
data modify storage mythcraft:temp city5 set from storage mythcraft:config cities.City5.name
data modify storage mythcraft:temp city6 set from storage mythcraft:config cities.City6.name
data modify storage mythcraft:temp city7 set from storage mythcraft:config cities.City7.name

# Get skill location names for teleport button labels
data modify storage mythcraft:temp skillAtk set from storage mythcraft:config skillLocations.Attack.name
data modify storage mythcraft:temp skillDef set from storage mythcraft:config skillLocations.Defense.name
data modify storage mythcraft:temp skillMag set from storage mythcraft:config skillLocations.Magic.name
data modify storage mythcraft:temp skillSpc set from storage mythcraft:config skillLocations.Special.name

# Resolve player name via helmet trick (set_name resolves selector server-side)
# NOTE: If named helmets are ever added, the custom_name restore will need a different approach
# (set_name with nbt/storage/interpret doesn't resolve; it stores the literal component definition)
data modify storage mythcraft:temp playerName set value "Player"
# If no helmet, temporarily place one
execute unless items entity @s armor.head * run item replace entity @s armor.head with stone_button
# Resolve @s selector into the item's custom_name, then read the plain username
item modify entity @s armor.head mythcraft:resolve_player_name
data modify storage mythcraft:temp playerName set from entity @s equipment.head.components."minecraft:custom_name".insertion
# Clean up: clear custom_name from helmet, or remove temp item
execute if items entity @s armor.head stone_button run item replace entity @s armor.head with air
execute unless items entity @s armor.head stone_button run item modify entity @s armor.head mythcraft:clear_custom_name

# Show the dialog
function mythcraft:menu/show with storage mythcraft:temp
