# Do not edit this file.


# Creating KFrame scores, on_start base scoreboard
scoreboard objectives add KFrame dummy
scoreboard objectives add KFrame.load minecraft.custom:minecraft.leave_game

scoreboard players set #KFrame.const1 KFrame 1

# Turning on the main namespace
function main:on_load