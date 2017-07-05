#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ ! -d ${DIR}/tmp ]; then
    mkdir ${DIR}/tmp
fi

cd ${DIR}/tmp

########################################################################
#          handling ETCD                                               #
# Version > 3 needed for kubernetes, so i can't go from packaging (V2) #
########################################################################

ETCD_VER=v3.2.1
 
# choose either URL
GOOGLE_URL=https://storage.googleapis.com/etcd
GITHUB_URL=https://github.com/coreos/etcd/releases/download
DOWNLOAD_URL=${GOOGLE_URL}
ETCD_ARCHIVE=etcd-${ETCD_VER}-linux-amd64.tar.gz

if [ ! -f ${DIR}/tmp/${ETCD_ARCHIVE} ]; then
    curl -L ${DOWNLOAD_URL}/${ETCD_VER}/${ETCD_ARCHIVE} -o ${DIR}/tmp/${ETCD_ARCHIVE}
fi

########################################################################
#             Getting Kubernetes binaries                              #
########################################################################
export KUBERNETES_SKIP_CONFIRM=1
export KUBERNETES_SKIP_CREATE_CLUSTER=1
export KUBERNETES_SERVER_ARCH=amd64

if [ ! -f get_kube.sh ]; then
    wget -O get_kube.sh https://get.k8s.io/
    chmod 755 get_kube.sh
    ./get_kube.sh
fi

########################################################################
#             Getting rkt .deb                                         #
########################################################################

if [ ! -f rkt_1.27.0-1_amd64.deb ]; then
    wget https://github.com/rkt/rkt/releases/download/v1.27.0/rkt_1.27.0-1_amd64.deb
fi

########################################################################
#             Getting vagrant 1.9.5                                    #
# Bug in the old version for private network                           #
########################################################################

vagrant version | grep 1.9.5 > /dev/null
if [ $? != 0 ]; then
    if [ ! -f vagrant_1.9.5_x86_64.deb ]; then
        wget https://releases.hashicorp.com/vagrant/1.9.5/vagrant_1.9.5_x86_64.deb
    fi
    sudo apt remove vagrant
    sudo dpkg -i vagrant_1.9.5_x86_64.deb
fi

cd ${DIR}

vagrant provision