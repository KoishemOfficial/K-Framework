data merge storage kf_inputs {lock:{w:"",a:"",s:"",d:"",ctrl:"",space:"",shift:"",slot1:"",slot2:"",slot3:"",slot4:"",slot5:"",slot6:"",slot7:"",slot8:"",slot9:""}}

execute if score @s inputs.w_lock matches 1 run data modify storage kf_inputs lock.w set value "red"
execute unless score @s inputs.w_lock matches 1 run data modify storage kf_inputs lock.w set value "green"

execute if score @s inputs.a_lock matches 1 run data modify storage kf_inputs lock.a set value "red"
execute unless score @s inputs.a_lock matches 1 run data modify storage kf_inputs lock.a set value "green"

execute if score @s inputs.s_lock matches 1 run data modify storage kf_inputs lock.s set value "red"
execute unless score @s inputs.s_lock matches 1 run data modify storage kf_inputs lock.s set value "green"

execute if score @s inputs.d_lock matches 1 run data modify storage kf_inputs lock.d set value "red"
execute unless score @s inputs.d_lock matches 1 run data modify storage kf_inputs lock.d set value "green"

execute if score @s inputs.ctrl_lock matches 1 run data modify storage kf_inputs lock.ctrl set value "red"
execute unless score @s inputs.ctrl_lock matches 1 run data modify storage kf_inputs lock.ctrl set value "green"

execute if score @s inputs.space_lock matches 1 run data modify storage kf_inputs lock.space set value "red"
execute unless score @s inputs.space_lock matches 1 run data modify storage kf_inputs lock.space set value "green"

execute if score @s inputs.shift_lock matches 1 run data modify storage kf_inputs lock.shift set value "red"
execute unless score @s inputs.shift_lock matches 1 run data modify storage kf_inputs lock.shift set value "green"

execute if score @s inputs.slot1_lock matches 1 run data modify storage kf_inputs lock.slot1 set value "red"
execute unless score @s inputs.slot1_lock matches 1 run data modify storage kf_inputs lock.slot1 set value "green"

execute if score @s inputs.slot2_lock matches 1 run data modify storage kf_inputs lock.slot2 set value "red"
execute unless score @s inputs.slot2_lock matches 1 run data modify storage kf_inputs lock.slot2 set value "green"

execute if score @s inputs.slot3_lock matches 1 run data modify storage kf_inputs lock.slot3 set value "red"
execute unless score @s inputs.slot3_lock matches 1 run data modify storage kf_inputs lock.slot3 set value "green"

execute if score @s inputs.slot4_lock matches 1 run data modify storage kf_inputs lock.slot4 set value "red"
execute unless score @s inputs.slot4_lock matches 1 run data modify storage kf_inputs lock.slot4 set value "green"

execute if score @s inputs.slot5_lock matches 1 run data modify storage kf_inputs lock.slot5 set value "red"
execute unless score @s inputs.slot5_lock matches 1 run data modify storage kf_inputs lock.slot5 set value "green"

execute if score @s inputs.slot6_lock matches 1 run data modify storage kf_inputs lock.slot6 set value "red"
execute unless score @s inputs.slot6_lock matches 1 run data modify storage kf_inputs lock.slot6 set value "green"

execute if score @s inputs.slot7_lock matches 1 run data modify storage kf_inputs lock.slot7 set value "red"
execute unless score @s inputs.slot7_lock matches 1 run data modify storage kf_inputs lock.slot7 set value "green"

execute if score @s inputs.slot8_lock matches 1 run data modify storage kf_inputs lock.slot8 set value "red"
execute unless score @s inputs.slot8_lock matches 1 run data modify storage kf_inputs lock.slot8 set value "green"

execute if score @s inputs.slot9_lock matches 1 run data modify storage kf_inputs lock.slot9 set value "red"
execute unless score @s inputs.slot9_lock matches 1 run data modify storage kf_inputs lock.slot9 set value "green"

execute as @s run function kf_inputs:private/print_chat with storage kf_inputs lock
