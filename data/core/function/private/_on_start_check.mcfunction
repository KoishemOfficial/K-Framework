# Do not edit this file.


# If on_start is restarted - run the on_start functions
execute if score @s KFrame.load matches 1 if score #KF_ON_START_LOCK KFrame matches 0 run function core:private/_on_start_execute
execute if score @s KFrame.load matches 0.. run scoreboard players set @s KFrame.load -1