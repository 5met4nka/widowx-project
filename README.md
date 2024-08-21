# widowx-project

Стек софта для работы с манипулятором [WIDOWX-MKII](https://www.trossenrobotics.com/WidowxRobotArmMK2) (Trossen Robotics)

<p align="center">
    <img src="https://www.trossenrobotics.com/images/PImages/widowx-a.jpg" width=300>
</p>


## список исходников репозитория

[пакет ROS для манипулятора WidowX-MKII (ветка `master`)](https://github.com/Interbotix/widowx_arm)

[пакет ROS для платы ArbotixM (ветка `noetic-devel`)](https://github.com/vanadiumlabs/arbotix_ros)

[архив с прошивкой платы](https://github.com/trossenrobotics/arbotix/archive/master.zip)

## начало работы

* установим бинарные пакеты командой

    ```bash
    sh src/widowx-project/scripts/install_binary_packages.sh
    ```

* в папке `src` выполним команду, которая установит все зависимости

    ```bash
    rosdep install -y -r \
        --from-paths src/ \
        --ignore-src \
        --rosdistro noetic
    ```

* соберем пакеты командой

    ```bash
    sh src/widowx-project/scripts/build.sh
    ```

* добавим устойство `ttyUSB_WIDOWX`

    ```bash
    sudo sh src/widowx-project/scripts/install_hardware_moduls.sh
    ```

    * после выполнения этой команды необходимо переподключить устройство!

* запустим контроллер робота командой

```bash
roslaunch widowx_arm_controller widowx_arm_controller.launch
```

* подадим команды для установки серв в заданные положения

```bash
rostopic pub /joint_1/command std_msgs/Float64 "data: 0.0" 
rostopic pub /joint_2/command std_msgs/Float64 "data: 0.0" 
rostopic pub /joint_3/command std_msgs/Float64 "data: 0.0" 
rostopic pub /joint_4/command std_msgs/Float64 "data: 0.0" 
rostopic pub /joint_5/command std_msgs/Float64 "data: 0.0" 
rostopic pub /gripper_revolute_joint/command std_msgs/Float64 "data: 0.0" 
```

* загрузим описание робота для визуализации состояния

```bash
roslaunch widowx_arm_description load_description.launch
```
