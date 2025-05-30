# Do not edit this file.


$data modify storage kf_quicksaves input.score set from storage kf_quicksaves $(active_node).data[$(active_id)].score
$data modify storage kf_quicksaves input.value set from storage kf_quicksaves $(active_node).data[$(active_id)].value
$data modify storage kf_quicksaves input.obj set from storage kf_quicksaves $(active_node).data[$(active_id)].obj

$tellraw @a [{"color":"gray","text":"ID: "},{"color":"green","text":"$(print_id) "},{"color":"gray","text":"Score: "},{"color":"green","text":"$(score)"},{"color":"gray","text":" Obj: "},{"color":"green","text":"$(obj)"},{"color":"gray","text":" Value: "},{"color":"green","text":"$(value)"}]

scoreboard players add #quicksave_id kf_quicksave 1
execute store result storage kf_quicksaves input.active_id int 1 run scoreboard players get #quicksave_id kf_quicksave
scoreboard players add #quicksave_print_id kf_quicksave 1
execute store result storage kf_quicksaves input.print_id int 1 run scoreboard players get #quicksave_print_id kf_quicksave

execute unless score #quicksave_id kf_quicksave matches 11.. run function kf_quicksave:private/print with storage kf_quicksaves input