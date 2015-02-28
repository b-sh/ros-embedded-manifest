keep_alive() {
	while true
	do
		# this is for telling travis not to kill the job when no output happens for long time
		# which can happen during bitbake build
		echo "Running please not kill!"
		sleep 60
	done
}

run_build() {
	repo init -b yocto/daisy-freescale -u https://github.com/bor-sh/ros-embedded-manifest.git
	repo sync
	TEMPLATECONF=meta-templates/conf/freescale source poky/oe-init-build-env yocto-fslc
	echo "Starting build"
	bitbake core-image-base	> log.txt
	ret=$?
	kill $keep_alive_pid >/dev/null 2>&1
	return $ret
}

keep_alive &
keep_alive_pid=$!
run_build