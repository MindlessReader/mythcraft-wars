# Give back compass to players who shift+right-clicked (consumption ate it)
execute as @a[tag=compassRestore] run item replace entity @s weapon with compass[enchantments={"minecraft:vanishing_curse":1},max_stack_size=1,food={nutrition:0,saturation:0,can_always_eat:true},consumable={consume_seconds:0.1,animation:"none",sound:"minecraft:intentionally_empty",has_consume_particles:false},lodestone_tracker={tracked:false,target:{dimension:"minecraft:the_end",pos:[I;0,0,0]}},custom_name="Unset, right click to set"]
tag @a[tag=compassRestore] remove compassRestore
