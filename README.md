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

In progress
