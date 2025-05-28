data merge storage inputs {trigger:{w:"",a:"",s:"",d:"",ctrl:"",space:"",shift:"",slot1:"",slot2:"",slot3:"",slot4:"",slot5:"",slot6:"",slot7:"",slot8:"",slot9:""}}

execute unless function kf_inputs:trigger/w run data modify storage inputs trigger.w set value "gray"
execute if score @s inputs.w_lock matches 1 unless function kf_inputs:trigger/w run data modify storage inputs trigger.w set value "red"
execute if function kf_inputs:trigger/w run data modify storage inputs trigger.w set value "green"

execute unless function kf_inputs:trigger/a run data modify storage inputs trigger.a set value "gray"
execute if score @s inputs.a_lock matches 1 unless function kf_inputs:trigger/a run data modify storage inputs trigger.a set value "red"
execute if function kf_inputs:trigger/a run data modify storage inputs trigger.a set value "green"

execute unless function kf_inputs:trigger/s run data modify storage inputs trigger.s set value "gray"
execute if score @s inputs.s_lock matches 1 unless function kf_inputs:trigger/s run data modify storage inputs trigger.s set value "red"
execute if function kf_inputs:trigger/s run data modify storage inputs trigger.s set value "green"

execute unless function kf_inputs:trigger/d run data modify storage inputs trigger.d set value "gray"
execute if score @s inputs.d_lock matches 1 unless function kf_inputs:trigger/d run data modify storage inputs trigger.d set value "red"
execute if function kf_inputs:trigger/d run data modify storage inputs trigger.d set value "green"

execute unless function kf_inputs:trigger/ctrl run data modify storage inputs trigger.ctrl set value "gray"
execute if score @s inputs.ctrl_lock matches 1 unless function kf_inputs:trigger/ctrl run data modify storage inputs trigger.ctrl set value "red"
execute if function kf_inputs:trigger/ctrl run data modify storage inputs trigger.ctrl set value "green"

execute unless function kf_inputs:trigger/shift run data modify storage inputs trigger.shift set value "gray"
execute if score @s inputs.shift_lock matches 1 unless function kf_inputs:trigger/shift run data modify storage inputs trigger.shift set value "red"
execute if function kf_inputs:trigger/shift run data modify storage inputs trigger.shift set value "green"

execute unless function kf_inputs:trigger/space run data modify storage inputs trigger.space set value "gray"
execute if score @s inputs.space_lock matches 1 unless function kf_inputs:trigger/space run data modify storage inputs trigger.space set value "red"
execute if function kf_inputs:trigger/space run data modify storage inputs trigger.space set value "green"

execute unless function kf_inputs:trigger/slot1 run data modify storage inputs trigger.slot1 set value "gray"
execute if score @s inputs.slot1_lock matches 1 unless function kf_inputs:trigger/slot1 run data modify storage inputs trigger.slot1 set value "red"
execute if function kf_inputs:trigger/slot1 run data modify storage inputs trigger.slot1 set value "green"

execute unless function kf_inputs:trigger/slot2 run data modify storage inputs trigger.slot2 set value "gray"
execute if score @s inputs.slot2_lock matches 1 unless function kf_inputs:trigger/slot2 run data modify storage inputs trigger.slot2 set value "red"
execute if function kf_inputs:trigger/slot2 run data modify storage inputs trigger.slot2 set value "green"

execute unless function kf_inputs:trigger/slot3 run data modify storage inputs trigger.slot3 set value "gray"
execute if score @s inputs.slot3_lock matches 1 unless function kf_inputs:trigger/slot3 run data modify storage inputs trigger.slot3 set value "red"
execute if function kf_inputs:trigger/slot3 run data modify storage inputs trigger.slot3 set value "green"

execute unless function kf_inputs:trigger/slot4 run data modify storage inputs trigger.slot4 set value "gray"
execute if score @s inputs.slot4_lock matches 1 unless function kf_inputs:trigger/slot4 run data modify storage inputs trigger.slot4 set value "red"
execute if function kf_inputs:trigger/slot4 run data modify storage inputs trigger.slot4 set value "green"

execute unless function kf_inputs:trigger/slot5 run data modify storage inputs trigger.slot5 set value "gray"
execute if score @s inputs.slot5_lock matches 1 unless function kf_inputs:trigger/slot5 run data modify storage inputs trigger.slot5 set value "red"
execute if function kf_inputs:trigger/slot5 run data modify storage inputs trigger.slot5 set value "green"

execute unless function kf_inputs:trigger/slot6 run data modify storage inputs trigger.slot6 set value "gray"
execute if score @s inputs.slot6_lock matches 1 unless function kf_inputs:trigger/slot6 run data modify storage inputs trigger.slot6 set value "red"
execute if function kf_inputs:trigger/slot6 run data modify storage inputs trigger.slot6 set value "green"

execute unless function kf_inputs:trigger/slot7 run data modify storage inputs trigger.slot7 set value "gray"
execute if score @s inputs.slot7_lock matches 1 unless function kf_inputs:trigger/slot7 run data modify storage inputs trigger.slot7 set value "red"
execute if function kf_inputs:trigger/slot7 run data modify storage inputs trigger.slot7 set value "green"

execute unless function kf_inputs:trigger/slot8 run data modify storage inputs trigger.slot8 set value "gray"
execute if score @s inputs.slot8_lock matches 1 unless function kf_inputs:trigger/slot8 run data modify storage inputs trigger.slot8 set value "red"
execute if function kf_inputs:trigger/slot8 run data modify storage inputs trigger.slot8 set value "green"

execute unless function kf_inputs:trigger/slot9 run data modify storage inputs trigger.slot9 set value "gray"
execute if score @s inputs.slot9_lock matches 1 unless function kf_inputs:trigger/slot9 run data modify storage inputs trigger.slot9 set value "red"
execute if function kf_inputs:trigger/slot9 run data modify storage inputs trigger.slot9 set value "green"

execute as @s run function kf_inputs:private/print_actionbar with storage inputs trigger
