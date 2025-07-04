# Do not edit this file.


# Pulling the quicksave data from the storage
$data remove storage quicksaves $(value)

# Incrementing the quicksave ID
scoreboard players add quicksave.node_list.id quicksave 1
execute store result storage quicksaves node_list.active_id int 1 run scoreboard players get quicksave.node_list.id quicksave

# Pulling the quicksave data from the storage
$data modify storage quicksaves node_list.value set from storage quicksaves node_list.data[$(active_id)]

# If the quicksave is not iterated through, run the function again
execute unless score quicksave.node_list.id quicksave >= quicksave.node_list.size quicksave run function modules:quicksave/private/_delete_all with storage quicksaves node_list

# If the quicksave is iterated through fully, delete the temporary data
execute if score quicksave.node_list.id quicksave = quicksave.node_list.size quicksave run function modules:quicksave/private/_clear_node_list
execute if score quicksave.node_list.id quicksave = quicksave.node_list.size quicksave run function modules:quicksave/private/_clear_temp {id:node_list}