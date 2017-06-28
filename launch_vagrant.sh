#!/usr/bin/env bash

export KUBERNETES_SKIP_CONFIRM=1
export KUBERNETES_SKIP_CREATE_CLUSTER=1
export KUBERNETES_SERVER_ARCH=amd64

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir ${DIR}/tmp
cd ${DIR}/tmp

# Problem with old version of vagrant and ubuntu xenial
vagrant version | grep 1.9.5 > /dev/null
if [ $? != 0 ]; then
    wget https://releases.hashicorp.com/vagrant/1.9.5/vagrant_1.9.5_x86_64.deb?_ga=2.231101533.319406025.1498673326-1645527223.1497308652
    sudo apt remove vagrant
    dpkg -i vagrant_1.9.5_x86_64.deb
fi



wget -O get_kube.sh https://get.k8s.io/

chmod 755 get_kube.sh

./get_kube.sh

cd ${DIR}

vagrant up