$execute if items entity @s container.$(magicSpell) minecraft:breeze_rod run item replace entity @s[scores={levelMagic=1..5,magicSpellCooldown=0}] container.$(magicSpell) with blaze_rod[enchantments={"minecraft:vanishing_curse":1}] 1
$item modify entity @s container.$(magicSpell) mythcraft:fireball
