# Do not edit this file.


# Removing and adding back KFrame.load scoreboards to reset them
# Unlocking the on_start lock
scoreboard objectives remove KFrame.load
scoreboard objectives add KFrame.load minecraft.custom:minecraft.leave_game
scoreboard players set #KF_ON_START_LOCK KFrame 0