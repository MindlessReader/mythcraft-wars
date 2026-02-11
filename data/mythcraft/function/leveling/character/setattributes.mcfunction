# Remove existing modifiers (fails silently if not present)
execute store success score @s _prevCharLevel run attribute @s minecraft:armor modifier remove mythcraft:class_armor
execute store success score @s _prevCharLevel run attribute @s minecraft:armor_toughness modifier remove mythcraft:class_toughness

# Warrior (class 1)
execute if score @s playerClass matches 1 if score @s characterLevel matches 1 run function mythcraft:leveling/character/applyattributes {armor:10,toughness:0}
execute if score @s playerClass matches 1 if score @s characterLevel matches 2 run function mythcraft:leveling/character/applyattributes {armor:12,toughness:1}
execute if score @s playerClass matches 1 if score @s characterLevel matches 3 run function mythcraft:leveling/character/applyattributes {armor:14,toughness:2}
execute if score @s playerClass matches 1 if score @s characterLevel matches 4 run function mythcraft:leveling/character/applyattributes {armor:16,toughness:3}
execute if score @s playerClass matches 1 if score @s characterLevel matches 5 run function mythcraft:leveling/character/applyattributes {armor:18,toughness:4}

# Assassin (class 2)
execute if score @s playerClass matches 2 if score @s characterLevel matches 1 run function mythcraft:leveling/character/applyattributes {armor:6,toughness:0}
execute if score @s playerClass matches 2 if score @s characterLevel matches 2 run function mythcraft:leveling/character/applyattributes {armor:7,toughness:0}
execute if score @s playerClass matches 2 if score @s characterLevel matches 3 run function mythcraft:leveling/character/applyattributes {armor:9,toughness:1}
execute if score @s playerClass matches 2 if score @s characterLevel matches 4 run function mythcraft:leveling/character/applyattributes {armor:11,toughness:2}
execute if score @s playerClass matches 2 if score @s characterLevel matches 5 run function mythcraft:leveling/character/applyattributes {armor:13,toughness:3}

# Bastion (class 3)
execute if score @s playerClass matches 3 if score @s characterLevel matches 1 run function mythcraft:leveling/character/applyattributes {armor:14,toughness:1}
execute if score @s playerClass matches 3 if score @s characterLevel matches 2 run function mythcraft:leveling/character/applyattributes {armor:16,toughness:2}
execute if score @s playerClass matches 3 if score @s characterLevel matches 3 run function mythcraft:leveling/character/applyattributes {armor:17,toughness:4}
execute if score @s playerClass matches 3 if score @s characterLevel matches 4 run function mythcraft:leveling/character/applyattributes {armor:18,toughness:6}
execute if score @s playerClass matches 3 if score @s characterLevel matches 5 run function mythcraft:leveling/character/applyattributes {armor:20,toughness:8}
