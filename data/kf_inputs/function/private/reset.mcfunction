execute unless entity @s[predicate=kf_inputs:w_input] run scoreboard players set @s inputs.w_trigger 0
execute unless entity @s[predicate=kf_inputs:a_input] run scoreboard players set @s inputs.a_trigger 0
execute unless entity @s[predicate=kf_inputs:s_input] run scoreboard players set @s inputs.s_trigger 0
execute unless entity @s[predicate=kf_inputs:d_input] run scoreboard players set @s inputs.d_trigger 0
execute unless entity @s[predicate=kf_inputs:sprint_input] run scoreboard players set @s inputs.ctrl_trigger 0
execute unless entity @s[predicate=kf_inputs:shift_input] run scoreboard players set @s inputs.shift_trigger 0
execute unless entity @s[predicate=kf_inputs:space_input] run scoreboard players set @s inputs.space_trigger 0

execute unless entity @s[nbt={SelectedItemSlot:0}] run scoreboard players set @s inputs.slot1_trigger 0
execute unless entity @s[nbt={SelectedItemSlot:1}] run scoreboard players set @s inputs.slot2_trigger 0
execute unless entity @s[nbt={SelectedItemSlot:2}] run scoreboard players set @s inputs.slot3_trigger 0
execute unless entity @s[nbt={SelectedItemSlot:3}] run scoreboard players set @s inputs.slot4_trigger 0
execute unless entity @s[nbt={SelectedItemSlot:4}] run scoreboard players set @s inputs.slot5_trigger 0
execute unless entity @s[nbt={SelectedItemSlot:5}] run scoreboard players set @s inputs.slot6_trigger 0
execute unless entity @s[nbt={SelectedItemSlot:6}] run scoreboard players set @s inputs.slot7_trigger 0
execute unless entity @s[nbt={SelectedItemSlot:7}] run scoreboard players set @s inputs.slot8_trigger 0
execute unless entity @s[nbt={SelectedItemSlot:8}] run scoreboard players set @s inputs.slot9_trigger 0