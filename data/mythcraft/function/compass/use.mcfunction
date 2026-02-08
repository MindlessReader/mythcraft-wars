item replace entity @s weapon with compass[enchantments={"minecraft:vanishing_curse":1},max_stack_size=1,food={nutrition:0,saturation:0,can_always_eat:true},consumable={consume_seconds:0.1},lodestone_tracker={tracked:false,target:{dimension:"minecraft:the_end",pos:[I;0,0,0]}},custom_name="Unset, right click to set"]

data modify storage mythcraft:nearest_troop position set from entity @n[tag=cityTroop,distance=1..] Pos
data modify storage mythcraft:nearest_troop name set from entity @n[tag=cityTroop,distance=1..] CustomName
execute as @n[tag=cityTroop,distance=1..] if entity @s[team=Unaligned] run data modify storage mythcraft:nearest_troop team set value Unaligned
execute as @n[tag=cityTroop,distance=1..] if entity @s[team=Unaligned] run data modify storage mythcraft:nearest_troop team set value Druid
execute as @n[tag=cityTroop,distance=1..] if entity @s[team=Unaligned] run data modify storage mythcraft:nearest_troop team set value Royal

execute at @s run playsound block.note_block.chime master @s ~ ~ ~

function mythcraft:compass/update with storage mythcraft:nearest_troop
advancement revoke @s only mythcraft:item/compass