# Do not edit this file.


# Removing a quicksave node
$function modules:quicksave/private/_clear_temp with storage quicksaves $(id)
$data remove storage quicksaves $(id)
$scoreboard players reset quicksave.$(id).size quicksave