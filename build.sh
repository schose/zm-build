#!/bin/bash

#set -e

# check if CUST_BUILD_NAME exists, otherwise use $CI_PROJECT_NAME
mkdir installer-build
cd installer-build    
git clone https://github.com/Zimbra/zm-build.git
cd zm-build
cp /tmp/config.build .
sudo mkdir -p /root/.ivy2/cache
sudo ENV_CACHE_CLEAR_FLAG=true ./build.pl
# --ant-options -DskipTests=true --git-default-tag=10.0.0-GA --build-release-no=10.0.0 --build-type=FOSS --build-release=NIKOLATESLA --build-release-candidate=GA --build-thirdparty-server=files.zimbra.com --build-no=3969 --no-interactive
# tar zcfv $CI_PROJECT_NAME.tar.gz installer-build   
# sha256sum $CI_PROJECT_NAME.tar.gz > $CI_PROJECT_NAME.tar.gz.sha256
# echo -n "sha256sum:" && cat $CI_PROJECT_NAME.tar.gz.sha256
# cd /builds/andreas/zimbra_build/
pwd
ls -lah /tmp
tar zcf /tmp/installer-build.tar.gz installer-build/BUILDS
ls -lah /tmp/installer-build.tar.gz
