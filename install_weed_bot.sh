#!/bin/sh
# Installs the required packages and nodes for the JetduinoBot
cd ~/
_dir="weed_bot/src"
# Check to make sure that the weed_bot catkin directory exists
[ ! -d "$_dir" ] && { echo "Error: Directory $_dir not found.\nPlease run create_weed_bot_ws.sh to create the weed_bot catkin workspace."; exit 2; }
# Install ros software

sudo apt-get install ros-indigo-rocon-remocon \
  ros-indigo-rocon-qt-library ros-indigo-ar-track-alvar-msgs \
  ros-indigo-collada-urdf ros-indigo-perception \
  ros-indigo-mrpt-navigation ros-indigo-gmapping \
  ros-indigo-xacro -y

sudo apt-get install ros-indigo-ros-control  \
  ros-indigo-joint-state-controller ros-indigo-robot-model \
  ros-indigo-effort-controllers ros-indigo-joint-trajectory-controller \
  ros-indigo-moveit* ros-indigo-octomap* ros-indigo-object-recognition-* \
  ros-indigo-ros-tutorials

cd ~/weed_bot/src
#git clone https://github.com/NeuroRoboticTech/weed_bot.git
##git clone https://github.com/jetsonhacks/turtlebot_create.git
##git clone https://github.com/jetsonhacks/turtlebot_interactions.git

#Checkout the opencv_bridge code. It must be recompiled for ros opencv3
git clone https://github.com/ros-perception/vision_opencv.git
cd vision_opencv
git checkout indigo
cd ..

# This is to get rviz to work; Apparently there's an issue in earlier versions not
# parsing collada file formats correctly under ARM
git clone https://github.com/jetsonhacks/robot_model.git
# This fixes an issue with navigation - laser map of RGBD camera was out of bounds
git clone -b laser_centered https://github.com/jetsonhacks/slam_gmapping.git
cd ..
catkin_make
/bin/echo -e "\e[1;32mweed_bot software installed.\e[0m"

