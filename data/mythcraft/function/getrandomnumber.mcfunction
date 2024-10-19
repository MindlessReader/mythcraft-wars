# function takes 1 parameter, "max", and returns a random number between 1 and "max" (inclusive)
scoreboard players add RNGseed RNG_Variable 1
execute store result score RNG RNG_Variable run time query gametime
scoreboard players operation RNG RNG_Variable *= RNGseed RNG_Variable
scoreboard players operation RNG RNG_Variable *= C_314159 RNG_Constant
scoreboard players operation RNG RNG_Variable *= C_2718281 RNG_Constant
scoreboard players operation RNG RNG_Variable *= RNG RNG_Variable
scoreboard players operation RNG RNG_Variable /= C_1000 RNG_Constant
scoreboard players operation RNG RNG_Variable *= C_314159 RNG_Constant
scoreboard players operation RNG RNG_Variable *= C_2718281 RNG_Constant

# scale to input
$scoreboard players set Scaler RNG_Variable $(max)
scoreboard players operation RNG RNG_Variable %= Scaler RNG_Variable
scoreboard players add RNG RNG_Variable 1
return run scoreboard players get RNG RNG_Variable