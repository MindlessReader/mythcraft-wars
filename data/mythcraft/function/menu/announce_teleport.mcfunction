# Send teleport announcement to all players
# Macro: $(locationName), $(locationColor)
$tellraw @a [{selector:"@s"},{text:" has just teleported to ",color:"gray"},{text:"$(locationName)",color:"$(locationColor)"}]
