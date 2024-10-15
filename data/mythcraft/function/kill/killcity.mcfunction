$scoreboard players add $(cityName) cityConquerProgress 1
$execute if score $(cityName) cityConquerProgress >= $(cityName) cityConquerValue as @s[team=Druids] run function mythcraft:conquer {cityName:$(cityName), teamId:1, teamName:Druids}
$execute if score $(cityName) cityConquerProgress >= $(cityName) cityConquerValue as @s[team=Royals] run function mythcraft:conquer {cityName:$(cityName), teamId:2, teamName:Royals}

$advancement revoke @s only mythcraft:kill/city/$(advancementName)
#say killed