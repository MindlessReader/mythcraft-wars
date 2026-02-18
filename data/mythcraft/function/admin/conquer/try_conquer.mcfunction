# Attempt to conquer city for the named player's team
# Params: $(cityId), $(playerName), $(cityDisplayName)

# Try Team1, then Team2 (mutually exclusive — player can only be on one team)
$execute as @a[name=$(playerName),team=Team1,limit=1] run function mythcraft:conquer {cityId:$(cityId), teamId:1, teamName:Team1, cityDisplayName:$(cityDisplayName)}
$execute as @a[name=$(playerName),team=Team2,limit=1] run function mythcraft:conquer {cityId:$(cityId), teamId:2, teamName:Team2, cityDisplayName:$(cityDisplayName)}

# Error: player not found online
$execute unless entity @a[name=$(playerName)] run tellraw @s [{color:"red",text:"[Admin] Player '$(playerName)' not found online."}]
# Error: player online but not on a team
$execute if entity @a[name=$(playerName)] unless entity @a[name=$(playerName),team=Team1] unless entity @a[name=$(playerName),team=Team2] run tellraw @s [{color:"red",text:"[Admin] Player '$(playerName)' is not on a team."}]
