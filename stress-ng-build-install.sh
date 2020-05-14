#!/bin/sh

# compile and install stress-ng version 0.11.09
	. ./lib/sh-test-lib
	
    echo "started installing stress-ng version 0.11.09 ..."
    echo "installing dependencies ..."
    install_deps "git build-essential libaio-dev libapparmor-dev libattr1-dev libbsd-dev libcap-dev libipsec-mb-dev libjudy-dev libkeyutils-dev libsctp-dev zlib1g-dev"
    echo "cloning git://kernel.ubuntu.com/cking/stress-ng.git ... "
    git clone git://kernel.ubuntu.com/cking/stress-ng.git
    (
        cd stress-ng || echo "stress-ng folder not found." && exit
        # Use 0.11.09 release for building.
        git checkout V0.11.09 -b V0.11.09
        echo "building and installing stress-ng ..."
        make clean && make && make install
    )

    if which stress-ng; then
        echo "stress-ng version: $(stress-ng --version)"
        exit 0
    else
        echo "stress-ng installation failed"
        exit 1
    fi
