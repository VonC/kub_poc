#!/usr/bin/env bash

export KUBERNETES_SKIP_CONFIRM=1
export KUBERNETES_SKIP_CREATE_CLUSTER=1
export KUBERNETES_SERVER_ARCH=amd64

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir ${DIR}/tmp
cd ${DIR}/tmp

wget -O get_kube.sh https://get.k8s.io/

chmod 755 get_kube.sh

./get_kube.sh

cd ${DIR}

vagrant up