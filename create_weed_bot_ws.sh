#!/bin/sh
# Create a ROS catkin workspace for JetduinoBot
# JetduinoBot is a ROS robot that uses the NVIDIA Jetson TK1/TX1 and the Jetduino
# interface board.
# This script assumes that ROS Indigo has already been installed on the Jetson
mkdir -p ~/weed_bot/src
cd ~/weed_bot/src
catkin_init_workspace
cd ~/weed_bot
catkin_make


