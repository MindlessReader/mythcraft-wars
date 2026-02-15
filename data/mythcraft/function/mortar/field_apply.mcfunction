# Apply Jump Boost to nearby allied players (scales with character level)

# Level 1-2: Jump Boost IV, radius 3
$execute if score @s mortarCharLevel matches 1..2 run effect give @a[team=$(team),distance=..3] jump_boost 1 3

# Level 3-4: Jump Boost V, radius 4
$execute if score @s mortarCharLevel matches 3..4 run effect give @a[team=$(team),distance=..4] jump_boost 1 4

# Level 5: Jump Boost V, radius 5
$execute if score @s mortarCharLevel matches 5.. run effect give @a[team=$(team),distance=..5] jump_boost 1 4
