# Do not edit this file.


# Creating a storage
$data merge storage dialogue_queues {$(name):{list:[$(list)],current:"",index:0,id:$(name)}}

scoreboard objectives add dialogues.queue dummy

# Storing list size
$execute store result score .dialogue.$(name).queue_len dialogues.queue run data get storage minecraft:dialogue_queues $(name).list

# Decrementing it to fit array indexing
$scoreboard players remove .dialogue.$(name).queue_len dialogues.queue 1

# Creating current_index scoreboard
$scoreboard players set .dialogue.$(name).queue_index dialogues.queue 0
$execute store result storage dialogue_queues $(name).index int 1 run scoreboard players get .dialogue.$(name).queue_index dialogues.queue

# Pulling the first value out of a list
$data modify storage dialogue_queues $(name).current set from storage dialogue_queues $(name).list[0]