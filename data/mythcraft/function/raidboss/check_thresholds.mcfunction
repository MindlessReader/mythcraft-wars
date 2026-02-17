# Check HP breakpoints (75%, 50%, 25%) and announce if newly crossed
# Uses C_2, C_3, C_4 constants on mathCounter

# 75% threshold: maxHP * 3 / 4
execute unless data storage mythcraft:raidboss {announced75:1b} run scoreboard players operation _threshold mathCounter = RaidBoss raidBossMaxHP
execute unless data storage mythcraft:raidboss {announced75:1b} run scoreboard players operation _threshold mathCounter *= C_3 mathCounter
execute unless data storage mythcraft:raidboss {announced75:1b} run scoreboard players operation _threshold mathCounter /= C_4 mathCounter
execute unless data storage mythcraft:raidboss {announced75:1b} if score RaidBoss raidBossHP <= _threshold mathCounter run function mythcraft:raidboss/announce_threshold {percent:"75%"}

# 50% threshold: maxHP / 2
execute unless data storage mythcraft:raidboss {announced50:1b} run scoreboard players operation _threshold mathCounter = RaidBoss raidBossMaxHP
execute unless data storage mythcraft:raidboss {announced50:1b} run scoreboard players operation _threshold mathCounter /= C_2 mathCounter
execute unless data storage mythcraft:raidboss {announced50:1b} if score RaidBoss raidBossHP <= _threshold mathCounter run function mythcraft:raidboss/announce_threshold {percent:"50%"}

# 25% threshold: maxHP / 4
execute unless data storage mythcraft:raidboss {announced25:1b} run scoreboard players operation _threshold mathCounter = RaidBoss raidBossMaxHP
execute unless data storage mythcraft:raidboss {announced25:1b} run scoreboard players operation _threshold mathCounter /= C_4 mathCounter
execute unless data storage mythcraft:raidboss {announced25:1b} if score RaidBoss raidBossHP <= _threshold mathCounter run function mythcraft:raidboss/announce_threshold {percent:"25%"}
