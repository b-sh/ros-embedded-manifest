# Manifest

It handles multiple yocto or openembedded layers git repositories.

# Branching Draft

1. master - holds the current development 
2. develop_yocto or develop_oe- holds integration of new releases
3. release_yocto or release_oe - holds release branch (temp)

# Install Repo

```
$ curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
$ chmod a+x ~/bin/repo
```

Put bin folder to PATH

More infos [Link](http://source.android.com/source/downloading.html)

# Repo init

## Openembedded

```
$ repo init -u https://github.com/b-sh/ros-embedded-manifest.git -m openembedded.xml
§ repo sync
```

### BMWCarIT releases

```
$ repo init -b refs/tags/bmwcarit-v0.1 -u https://github.com/b-sh/ros-embedded-manifest.git -m openembedded.xml
$ repo sync
```

#### Checkout master

```
$ repo init -b bmwcarit-develop -u https://github.com/b-sh/ros-embedded-manifest.git -m openembedded.xml
$ repo sync
```

## Yocto

```
$ repo init -u https://github.com/b-sh/ros-embedded-manifest.git -m yoctoembedded.xml
§ repo sync
```

### Using working state

```
$ repo init -u https://github.com/b-sh/ros-embedded-manifest.git -m yoctoembedded.xml -b bmwcarit-yocto
§ repo sync
```

### Build

```
$ source poky/oe-init-build-env yocto
```

### Setup Config

conf/bblayers.conf

```
BBLAYERS ?= " \
  /home/ruth/RepoYocto/poky/meta \
  /home/ruth/RepoYocto/poky/meta-yocto \
  /home/ruth/RepoYocto/poky/meta-openembedded/meta-oe \
  /home/ruth/RepoYocto/poky/meta-ros \
  "
```

conf/local.conf

Optional
 
 * selecting machine (default qemux86)
 * parallelism options
 * ...

### Run build

```
bitbake core-image-ros-roscore

runqemu qemux86 core-image-ros-roscore
```

QEMU:

```
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

