# Do not edit this file.


# If predicate is true, and the input is unlocked - return 1
execute if entity @s[predicate=modules:inputs/slot5,scores={inputs.slot6_lock=0}] run return 1