# Wrapper to enter teleport editing from a city editor
# Macro params: $(cityId), $(cityNum)
$data modify storage mythcraft:nav teleportBack set value {type:"city",cityId:"$(cityId)",cityNum:$(cityNum)}
$function mythcraft:config/edit/teleport {path:"cities.$(cityId)",locName:"City $(cityNum)"}