# Apply stealth for $(seconds) seconds: invisibility effect + hide armor + timer
# Max-duration: if already stealthed with a longer timer, does not shorten it
$effect give @s invisibility $(seconds)
function mythcraft:stealth/hide_armor
$scoreboard players set #stealthNew mathCounter $(seconds)
scoreboard players operation #stealthNew mathCounter *= C_20 mathCounter
execute unless score @s stealthTimer > #stealthNew mathCounter run scoreboard players operation @s stealthTimer = #stealthNew mathCounter
