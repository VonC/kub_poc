# kub_poc
Learning kubernetes


notes: etcd : v3 needed if you don't want the api to freeze

kube-apiserver --insecure-bind-address=10.0.2.15 --etcd-servers=http://localhost:2379 --service-cluster-ip-range=192.168.242.0/24 --insecure-port=8080 --token-auth-file=/dev/null --cert-dir=$PWD/cert

kube-controller-manager --master 10.0.2.15:8080

kube-scheduler --master 10.0.2.15:8080


sudo /kubernetes/server/bin/kubelet --api-servers=http://10.0.2.15:8080 --cert-dir=$PWD/cert --container-runtime=rkt --pod-manifest-path=$PWD/manifests


sudo systemd-run rkt api-service
sudo systemd-run rkt metadata-service


kubectl config set-cluster TEST --server=http://127.0.0.1
