# Manifest

It handles multiple yocto or openembedded layers git repositories.

Work on: Ubuntu 12.04

# Build status

![Build Status](https://travis-ci.org/bor-sh/ros-embedded-manifest.svg)](https://travis-ci.org/bor-sh/ros-embedded-manifest)

# Branching Draft

1. master - holds the readme
2. oe/branchname - holds openembedded development lines
3. yocto/branchname - holds yocto development lines

# Prerequisites

## Install Repo

```
$ curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
$ chmod a+x ~/bin/repo
```

Put bin folder to PATH

More infos [Link](http://source.android.com/source/downloading.html)

## Packages

```
sudo apt-get install build-essential chrpath diffstat gawk git-core libsdl1.2-dev texinfo unzip wget xterm gettext
```

# Repo init

## Openembedded

```
$ repo init -b oe/master -u https://github.com/bor-sh/ros-embedded-manifest.git
§ repo sync
```

### BMWCarIT releases

```
$ repo init -b refs/tags/bmwcarit-v0.1 -u https://github.com/bor-sh/ros-embedded-manifest.git
$ repo sync
```

#### Develop line

```
$ repo init -b oe/bmwcarit -u https://github.com/b-sh/ros-embedded-manifest.git
$ repo sync
```

## Yocto

```
$ repo init -b yocto/master -u https://github.com/b-sh/ros-embedded-manifest.git
§ repo sync
```

### Using latest working state

```
$ repo init -b yocto/bmwcarit-release -u https://github.com/b-sh/ros-embedded-manifest.git
§ repo sync
```

### Build

```
# for ROS only
TEMPLATECONF=meta-templates/conf/ros source poky/oe-init-build-env yocto
bitbake core-image-ros-roscore

# ROS + setup for imx35pdk
TEMPLATECONF=meta-templates/conf source poky/oe-init-build-env yocto-fslc-ros
bitbake core-image-ros-roscore

# freescale only
TEMPLATECONF=meta-templates/conf/freescale source poky/oe-init-build-env yocto-fslc
bitbake core-image-base
```

Adjust bblayers.conf and local.conf if required.

Optional
 
 * selecting machine (default qemux86)
 * parallelism options
 * ...

### Run ROS qemu build

QEMU:

```
runqemu qemux86 core-image-ros-roscore
# before running roscore need some setup inside qemux86
vi /etc/hosts
# add
127.0.0.1    qemux86
# exit :wq

# export flags
export ROS_ROOT=/usr
export ROS_MASTER_URI=http://localhost:11311
export CMAKE_PREFIX_PATH=/usr
touch /usr/.catkin

# run
roscore
```

