# roselito_simulation

Simulation environment for the ROSelito project.

## Repository Cloning & Management

Make sure to have both `git` and the `git-lfs` plugin installed before cloning the repository:

    sudo apt install git git-lfs

The source tree includes all packages composing the software stack as [git submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules). Use the command below to clone the submodules alongside the parent project:

    git clone --recurse-submodules git@github.com:ros2amr/roselito_simulation.git

When pulling changes from the repository, remember to add the `--recurse-submodules` option to also pull changes to individual packages:

    git pull --rebase --recurse-submodules

If you run into trouble downloading binary files stored in Large File Storage (LFS), run the command below to explicitly pull them:

    git submodule foreach git lfs pull

# Usage

All commands should be executed from inside the ROS2AMR [environment](https://github.com/ros2amr/docker_environment).

Before running the simulation for the first time, download all Gazebo models with:

    ./scripts/download_gazebo_models.sh

To build the workspace, `cd` into its root folder and enter:

    ./scripts/make.sh

During development, it may useful to use the `--symlink-install` option to create symbolic links (symlinks) to your source code files in the install directory instead of copying them:

    ./scripts/make.sh --symlink-install

This allows launch scripts, configuration files etc. to be updated without rebuilding the workspace.

If needed, the current build can be erased with:

    ./scripts/make_clean.sh

In any case, after he workspace is built it has to be sourced so that packages are visible to the ROS tools. This can be done with:

    source ./scripts/setup.bash

To start the simulated environment, enter:

    ros2 launch roselito_gazebo start.launch

The command above will start Gazebo, load a world and place a robot inside it. To control the robot with the help of RQT, open a new GNU screen window and enter:

    rqt

Then load the _Robot Steering_ plugin and set its topic to`/cmd_vel`.
