# Totem was consumed by death_protection (player survived lethal damage)
# Detected via luck amplifier 99 marker effect applied by death_effects
# Effects (speed, invis, resistance, regen, absorption) already applied by death_protection
effect clear @s luck

# Reset charge and give a new uncharged totem
scoreboard players set @s totemCharge 0
item replace entity @s weapon.offhand with totem_of_undying[enchantments={"minecraft:vanishing_curse":1},enchantment_glint_override=false,custom_data={mythcraft_totem:true},max_damage=64,damage=64,food={nutrition:0,saturation:0,can_always_eat:true},consumable={consume_seconds:100,animation:"none",sound:"minecraft:intentionally_empty",has_consume_particles:false},tooltip_display={hidden_components:["minecraft:food","minecraft:consumable","minecraft:enchantments"]}]
function mythcraft:totem/update

# Start stealth (armor + totem invisible for 15s)
function mythcraft:totem/hide_armor
item modify entity @s weapon.offhand {function:"minecraft:set_components",components:{"minecraft:item_model":"mythcraft:invisible"}}
scoreboard players set @s totemInvisTimer 300