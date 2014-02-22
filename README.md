# Manifest

It handles multiple yocto or openembedded layers git repositories.

# Branching Draft

1. master - holds the current development 
2. develop_yocto or develop_oe- holds integration of new releases
3. release_yocto or release_oe - holds release branch (temp)

# Install Repo

$ curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
$ chmod a+x ~/bin/repo

Put bin folder to PATH

More infos [Link](http://source.android.com/source/downloading.html)

# Repo init

## Openembedded

$ repo init -u git@github.com:b-sh/ros-embedded-manifest.git -m openembedded.xml

## Yocto

In progress
