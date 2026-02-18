# Actually delete all spawn markers within 20 blocks (after confirmation)
scoreboard players set @s adminAction 0
execute at @s run function mythcraft:markers/admin_deletenear
function mythcraft:admin/open
