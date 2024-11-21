#!/bin/bash

sudo apt-get update && sudo apt-get install -y \
    ros-$ROS_DISTRO-moveit \
    ros-$ROS_DISTRO-dynamixel-sdk \
    ros-$ROS_DISTRO-dynamixel-workbench \
    ros-$ROS_DISTRO-roboticsgroup-upatras-gazebo-plugins
