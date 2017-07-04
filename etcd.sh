ETCD_VER=v3.2.1
 
# choose either URL
GOOGLE_URL=https://storage.googleapis.com/etcd
GITHUB_URL=https://github.com/coreos/etcd/releases/download
DOWNLOAD_URL=${GOOGLE_URL}

rm -f /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz
rm -rf /tmp/test-etcd && mkdir -p /tmp/test-etcd

curl -L ${DOWNLOAD_URL}/${ETCD_VER}/etcd-${ETCD_VER}-linux-amd64.tar.gz -o /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz
tar xzvf /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz -C /tmp/test-etcd --strip-components=1

/tmp/test-etcd/etcd --version
<<COMMENT
etcd Version: 3.2.1
Git SHA: 61fc123
Go Version: go1.8.3
Go OS/Arch: linux/amd64
COMMENT
 
ETCDCTL_API=3 /tmp/test-etcd/etcdctl version
<<COMMENT
etcdctl version: 3.2.1
API version: 3.2
COMMENT


https://github.com/coreos/etcd/releases/download/v3.2.1/etcd-v3.2.1-linux-amd64.tar.gz