# Do not edit this file.


# If predicate is true, and the input is unlocked - return 1, and set the trigger score to 1
# It won't trigger again until the trigger score is reset
execute if entity @s[predicate=modules:inputs/space_input,scores={inputs.space_lock=0,inputs.space_trigger=0}] run return run scoreboard players set @s inputs.space_trigger 1