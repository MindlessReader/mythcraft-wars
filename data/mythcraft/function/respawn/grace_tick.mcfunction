# Decrement grace period timers (1s scheduled loop)
# Self-stops when no cities have active grace periods

scoreboard players set _anyGrace mathCounter 0

# City1
execute if score City1 graceTimer matches 1.. run scoreboard players remove City1 graceTimer 1
execute if score City1 graceTimer matches 1.. run scoreboard players set _anyGrace mathCounter 1
execute if score City1 graceTimer matches 0 if entity @e[tag=_gracePeriod,tag=City1,limit=1] run function mythcraft:respawn/end_grace {cityId:City1}

# City2
execute if score City2 graceTimer matches 1.. run scoreboard players remove City2 graceTimer 1
execute if score City2 graceTimer matches 1.. run scoreboard players set _anyGrace mathCounter 1
execute if score City2 graceTimer matches 0 if entity @e[tag=_gracePeriod,tag=City2,limit=1] run function mythcraft:respawn/end_grace {cityId:City2}

# City3
execute if score City3 graceTimer matches 1.. run scoreboard players remove City3 graceTimer 1
execute if score City3 graceTimer matches 1.. run scoreboard players set _anyGrace mathCounter 1
execute if score City3 graceTimer matches 0 if entity @e[tag=_gracePeriod,tag=City3,limit=1] run function mythcraft:respawn/end_grace {cityId:City3}

# City4
execute if score City4 graceTimer matches 1.. run scoreboard players remove City4 graceTimer 1
execute if score City4 graceTimer matches 1.. run scoreboard players set _anyGrace mathCounter 1
execute if score City4 graceTimer matches 0 if entity @e[tag=_gracePeriod,tag=City4,limit=1] run function mythcraft:respawn/end_grace {cityId:City4}

# City5
execute if score City5 graceTimer matches 1.. run scoreboard players remove City5 graceTimer 1
execute if score City5 graceTimer matches 1.. run scoreboard players set _anyGrace mathCounter 1
execute if score City5 graceTimer matches 0 if entity @e[tag=_gracePeriod,tag=City5,limit=1] run function mythcraft:respawn/end_grace {cityId:City5}

# City6
execute if score City6 graceTimer matches 1.. run scoreboard players remove City6 graceTimer 1
execute if score City6 graceTimer matches 1.. run scoreboard players set _anyGrace mathCounter 1
execute if score City6 graceTimer matches 0 if entity @e[tag=_gracePeriod,tag=City6,limit=1] run function mythcraft:respawn/end_grace {cityId:City6}

# City7
execute if score City7 graceTimer matches 1.. run scoreboard players remove City7 graceTimer 1
execute if score City7 graceTimer matches 1.. run scoreboard players set _anyGrace mathCounter 1
execute if score City7 graceTimer matches 0 if entity @e[tag=_gracePeriod,tag=City7,limit=1] run function mythcraft:respawn/end_grace {cityId:City7}

# Reschedule only if at least one city still has active grace
execute if score _anyGrace mathCounter matches 1 run schedule function mythcraft:respawn/grace_tick 1s
