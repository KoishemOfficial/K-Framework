# Do not edit this file.


$data modify storage kf_timers $(id).s set value $(value)
$data modify storage kf_timers $(id).init.[].s set value $(value)
$execute store result score .kf_timers.$(id).s kf_timers run data get storage kf_timers $(id).s 1