$execute unless score $(cityName) cityOwnership matches 1 as @s[team=Druids] run scoreboard players add $(cityName) cityConquerProgress 1
$execute unless score $(cityName) cityOwnership matches 2 as @s[team=Royals] run scoreboard players add $(cityName) cityConquerProgress 1
$execute unless score $(cityName) cityOwnership matches 1 if score $(cityName) cityConquerProgress >= $(cityName) cityConquerValue as @s[team=Druids] run function mythcraft:conquer {cityName:$(cityName), teamId:1, teamName:Druids, rewardFunction: $(advancementName)}
$execute unless score $(cityName) cityOwnership matches 2 if score $(cityName) cityConquerProgress >= $(cityName) cityConquerValue as @s[team=Royals] run function mythcraft:conquer {cityName:$(cityName), teamId:2, teamName:Royals, rewardFunction: $(advancementName)}

# if player killed a mob on their own team, respawns one from the nearest marker
#execute if score $(cityName) cityOwnership matches 1 as @s[team=Druids] at @e[tag=$(cityName),type=marker,sort=nearest,limit=1] run summon pig
#execute if score $(cityName) cityOwnership matches 2 as @s[team=Royals] at @e[tag=$(cityName),type=marker,sort=nearest,limit=1] run summon pig

$advancement revoke @s only mythcraft:kill/city/$(advancementName)