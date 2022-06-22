### 1. uninstall kubeadm
```bash
su
kubeadm reset
```
### 2. remove docker container
```bash
docker rm $(docker  ps -aq) -f
# remove images
docker rmi $(docker images -aq) -f
```
### 3. remove cluster's relative files
```bash
sudo rm -rf  /var/lib/etcd
sudo rm -rf  /etc/kubernetes
sudo rm -rf $HOME/.kube
```
### 4. auto uninstall
```bash
apt autoremove -y kubelet kubectl kubeadm kubernetes-cni
# if some error occurred
sudo swapoff -a
```
### 5. check port
```bash
lsof -i :6443
lsof -i :10250
sudo kill -9 `sudo lsof -t -i:10250`
sudo kill -9 `sudo lsof -t -i:6443`
```
### init
