# Do not edit this file.


$data modify storage timers $(id).s set value $(value)
$data modify storage timers $(id).init.[].s set value $(value)
$execute store result score timers.$(id).s timers run data get storage timers $(id).s 1