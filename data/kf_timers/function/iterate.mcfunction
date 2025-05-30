# Do not edit this file.


# If timers runs to its point - execute the command
$execute if score .kf_timers.$(id).t kf_timers = .kf_timers.$(id).end_t kf_timers if score .kf_timers.$(id).s kf_timers = .kf_timers.$(id).end_s kf_timers if score .kf_timers.$(id).m kf_timers = .kf_timers.$(id).end_m kf_timers if score .kf_timers.$(id).h kf_timers = .kf_timers.$(id).end_h kf_timers run function kf_timers:private/execute with storage kf_timers $(id)

# Iteration process
$execute if score .kf_timers.$(id).t kf_timers matches 0.. if score .kf_timers.$(id).single kf_timers matches 0 unless score .kf_timers.$(id).s kf_timers = .kf_timers.$(id).end_s kf_timers run scoreboard players add .kf_timers.$(id).t kf_timers 1
$execute if score .kf_timers.$(id).t kf_timers matches 0.. if score .kf_timers.$(id).single kf_timers matches 0 unless score .kf_timers.$(id).m kf_timers = .kf_timers.$(id).end_m kf_timers run scoreboard players add .kf_timers.$(id).t kf_timers 1
$execute if score .kf_timers.$(id).t kf_timers matches 0.. if score .kf_timers.$(id).single kf_timers matches 0 unless score .kf_timers.$(id).h kf_timers = .kf_timers.$(id).end_h kf_timers run scoreboard players add .kf_timers.$(id).t kf_timers 1
$execute if score .kf_timers.$(id).t kf_timers matches 0.. if score .kf_timers.$(id).single kf_timers matches 1.. run scoreboard players add .kf_timers.$(id).t kf_timers 1

# Incrementings values
$execute if score .kf_timers.$(id).t kf_timers matches 20.. run function kf_timers:private/increment_s with storage kf_timers $(id)
$execute if score .kf_timers.$(id).s kf_timers matches 60.. run function kf_timers:private/increment_m with storage kf_timers $(id)
$execute if score .kf_timers.$(id).m kf_timers matches 60.. run function kf_timers:private/increment_h with storage kf_timers $(id)

# Storing them back in data
$execute store result storage kf_timers $(id).h int 1 run scoreboard players get .kf_timers.$(id).h kf_timers
$execute store result storage kf_timers $(id).m int 1 run scoreboard players get .kf_timers.$(id).m kf_timers
$execute store result storage kf_timers $(id).s int 1 run scoreboard players get .kf_timers.$(id).s kf_timers
$execute store result storage kf_timers $(id).t int 1 run scoreboard players get .kf_timers.$(id).t kf_timers