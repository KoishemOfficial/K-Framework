# Do not edit this file.


# Pulling the data from the quicksave node
$data modify storage quicksaves $(active_node).input.score set from storage quicksaves $(active_node).data[$(active_id)].score
$data modify storage quicksaves $(active_node).input.value set from storage quicksaves $(active_node).data[$(active_id)].value
$data modify storage quicksaves $(active_node).input.obj set from storage quicksaves $(active_node).data[$(active_id)].obj

# Displaying the data
$tellraw @a [{"color":"gray","text":"ID: "},{"color":"green","text":"$(print_id) "},{"color":"gray","text":"SCORE: "},{"color":"aqua","text":"$(score)"},{"color":"gray","text":" OBJ: "},{"color":"gold","text":"$(obj)"},{"color":"gray","text":" VAL: "},{"color":"light_purple","text":"$(value)"}]

# Incrementing the quicksave ID
$scoreboard players add quicksave.$(active_node).id quicksave 1
$execute store result storage quicksaves $(active_node).input.active_id int 1 run scoreboard players get quicksave.$(active_node).id quicksave

# Incrementing the quicksave print ID
$scoreboard players add quicksave.$(active_node).print.id quicksave 1
$execute store result storage quicksaves $(active_node).input.print_id int 1 run scoreboard players get quicksave.$(active_node).print.id quicksave

# If the quicksave is not iterated through, run the function again
$execute unless score quicksave.$(active_node).id quicksave >= quicksave.$(active_node).size quicksave run function modules:quicksave/private/_print with storage quicksaves $(active_node).input

# If the quicksave is iterated through fully, delete the temporary data
$execute if score quicksave.$(active_node).id quicksave = quicksave.$(active_node).size quicksave run function modules:quicksave/private/_clear_temp with storage quicksaves $(active_node)