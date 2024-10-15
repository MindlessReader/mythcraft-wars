#function that runs every 3 minutes to check if troops need to be respawned
execute if score Celak cityConquerProgress matches 1.. if score Celak cityConquerProgress = CelakLastChecked cityConquerProgress run function mythcraft:respawn/callback/celak
execute if score Kings-Port cityConquerProgress matches 1.. if score Kings-Port cityConquerProgress = Kings-PortLastChecked cityConquerProgress run function mythcraft:respawn/callback/kings-port
execute if score Athens cityConquerProgress matches 1.. if score Athens cityConquerProgress = AthensLastChecked cityConquerProgress run function mythcraft:respawn/callback/athens
execute if score Delphi cityConquerProgress matches 1.. if score Delphi cityConquerProgress = DelphiLastChecked cityConquerProgress run function mythcraft:respawn/callback/delphi
execute if score Povertane cityConquerProgress matches 1.. if score Povertane cityConquerProgress = PovertaneLastChecked cityConquerProgress run function mythcraft:respawn/callback/povertane
execute if score Amnis cityConquerProgress matches 1.. if score Amnis cityConquerProgress = AmnisLastChecked cityConquerProgress run function mythcraft:respawn/callback/amnis
execute if score Fronteria cityConquerProgress matches 1.. if score Fronteria cityConquerProgress = FronteriaLastChecked cityConquerProgress run function mythcraft:respawn/callback/fronteria

scoreboard players operation CelakLastChecked cityConquerProgress = Celak cityConquerProgress
scoreboard players operation Kings-PortLastChecked cityConquerProgress = Kings-Port cityConquerProgress
scoreboard players operation AthensLastChecked cityConquerProgress = Athens cityConquerProgress
scoreboard players operation DelphiLastChecked cityConquerProgress = Delphi cityConquerProgress
scoreboard players operation PovertaneLastChecked cityConquerProgress = Povertane cityConquerProgress
scoreboard players operation AmnisLastChecked cityConquerProgress = Amnis cityConquerProgress
scoreboard players operation FronteriaLastChecked cityConquerProgress = Fronteria cityConquerProgress

schedule function mythcraft:respawn/respawnchecker 180s