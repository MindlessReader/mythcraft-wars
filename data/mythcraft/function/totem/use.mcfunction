# Advancement handler for totem right-click (using_item)
# Only assassins can use the totem ability
execute unless score @s playerClass matches 2 run advancement revoke @s only mythcraft:item/totem
execute unless score @s playerClass matches 2 run return 0

# Immediately replace totem to cancel consumption (same pattern as compass)
item replace entity @s weapon.offhand with totem_of_undying[enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false,custom_data={mythcraft_totem:true},max_damage=64,damage=64,food={nutrition:0,saturation:0,can_always_eat:true},consumable={consume_seconds:100,animation:"none",sound:"minecraft:intentionally_empty",has_consume_particles:false},tooltip_display={hidden_components:["minecraft:food","minecraft:consumable","minecraft:enchantments"]}]

# Restore correct charge display
function mythcraft:totem/update

# Preserve invisible totem model if stealth is active (re-triggered by held right-click)
execute if score @s totemInvisTimer matches 1.. run item modify entity @s weapon.offhand {function:"minecraft:set_components",components:{"minecraft:item_model":"mythcraft:invisible"}}

# Check cooldown and charge (25%) before activating
# Level 1: need 16, Level 2: need 12, Level 3: need 9, Level 4: need 6, Level 5: need 4
execute if score @s totemCooldown matches ..0 if score @s characterLevel matches ..1 if score @s totemCharge matches 16.. run function mythcraft:totem/activate
execute if score @s totemCooldown matches ..0 if score @s characterLevel matches 2 if score @s totemCharge matches 12.. run function mythcraft:totem/activate
execute if score @s totemCooldown matches ..0 if score @s characterLevel matches 3 if score @s totemCharge matches 9.. run function mythcraft:totem/activate
execute if score @s totemCooldown matches ..0 if score @s characterLevel matches 4 if score @s totemCharge matches 6.. run function mythcraft:totem/activate
execute if score @s totemCooldown matches ..0 if score @s characterLevel matches 5.. if score @s totemCharge matches 4.. run function mythcraft:totem/activate

advancement revoke @s only mythcraft:item/totem
