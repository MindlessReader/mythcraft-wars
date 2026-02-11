# Check if character XP has reached a new level threshold
scoreboard players operation @s _prevCharLevel = @s characterLevel

execute if score @s characterLevel matches ..0 if score @s characterXP >= CharLvl1 characterXPThresholds run scoreboard players set @s characterLevel 1
execute if score @s characterLevel matches ..1 if score @s characterXP >= CharLvl2 characterXPThresholds run scoreboard players set @s characterLevel 2
execute if score @s characterLevel matches ..2 if score @s characterXP >= CharLvl3 characterXPThresholds run scoreboard players set @s characterLevel 3
execute if score @s characterLevel matches ..3 if score @s characterXP >= CharLvl4 characterXPThresholds run scoreboard players set @s characterLevel 4
execute if score @s characterLevel matches ..4 if score @s characterXP >= CharLvl5 characterXPThresholds run scoreboard players set @s characterLevel 5

# Only act if level actually changed
execute unless score @s characterLevel = @s _prevCharLevel run function mythcraft:leveling/character/onlevelup
