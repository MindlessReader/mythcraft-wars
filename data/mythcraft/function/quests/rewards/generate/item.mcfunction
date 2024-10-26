# generate random selection from list
execute store result score QuestTracker questReward run function mythcraft:getrandomnumber {max:10}

execute if score QuestTracker questReward matches 1 run data modify storage mythcraft:quest rewardText set value "Enchanted Golden Apple"
execute if score QuestTracker questReward matches 2 run data modify storage mythcraft:quest rewardText set value "5 Ender Pearls"
execute if score QuestTracker questReward matches 3 run data modify storage mythcraft:quest rewardText set value "5 Wind Charges"
execute if score QuestTracker questReward matches 4 run data modify storage mythcraft:quest rewardText set value "Totem of Undying"
execute if score QuestTracker questReward matches 5 run data modify storage mythcraft:quest rewardText set value "Potion of Strength II"
execute if score QuestTracker questReward matches 6 run data modify storage mythcraft:quest rewardText set value "Netherite Axe"
execute if score QuestTracker questReward matches 7 run data modify storage mythcraft:quest rewardText set value "3 Splash Potions of Harming II"
execute if score QuestTracker questReward matches 8 run data modify storage mythcraft:quest rewardText set value "Mace"
execute if score QuestTracker questReward matches 9 run data modify storage mythcraft:quest rewardText set value "Sharpness V Trident"
execute if score QuestTracker questReward matches 10 run data modify storage mythcraft:quest rewardText set value "Multishot Crossbow"