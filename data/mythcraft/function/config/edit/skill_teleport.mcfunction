# Wrapper to enter teleport editing from the skills editor
# Macro params: $(skill) e.g. "Attack", "Defense", "Magic", "Special"
$data modify storage mythcraft:nav teleportBack set value {type:"skill",skill:"$(skill)"}
$function mythcraft:config/edit/teleport {path:"skillLocations.$(skill)",locName:"$(skill)"}