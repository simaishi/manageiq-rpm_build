#!/bin/bash

set -x

venv_path=$VENV_PATH/venv
rpm_path=/root/rpms

# Setup venv
echo "*** Setting up venv"
python3 -m venv $venv_path
source $venv_path/bin/activate
pip3 install --no-compile -r $VENV_PATH/requirements.txt
echo $PATH
deactivate

# Build RPM
echo "*** Building rpm"
mkdir -p $rpm_path
tar -C $VENV_PATH --transform "s,^,$NAME-$VERSION/," -hzcf $rpm_path/$NAME-$VERSION.tar.gz .
rpmbuild -bb --define "_sourcedir $rpm_path" --define "_rpmdir $rpm_path" /$NAME.spec
