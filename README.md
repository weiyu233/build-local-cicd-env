## Build a k8s-cluster with Ubuntu 20.04

### 1. Before we begin
You can see [here](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/#before-you-begin) that k8s official site had already told us.
#### 1.1 2C2G virtual machines
|Name|ip|role|
|---|---|---|
|k8s-master|11.0.1.210|master|
|k8s-node01|11.0.1.211|node|
|k8s-node02|11.0.1.212|node|
#### 1.2 Installing Ansible
[how to install ansible](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-ansible-on-ubuntu-20-04#step-1-%E2%80%94-installing-ansible)

#### 1.3 Git clone
```bash
$ git clone git@github.com:weiyu233/k8s-cluster.git
```

### 2. Creating a Non-Root User on All Remote Servers
```bash
$ ansible-playbook -i hosts /home/kubeuser/k8s-cluster/initial.yml
```
### 3. Installing Kubernetetes’ Dependencies
```bash
$ ansible-playbook -i hosts /home/kubeuser/k8s-cluster/kube-dependencies.yml
```
### 4. Setting Up the Master Node
```bash
$ ansible-playbook -i hosts /home/kubeuser/k8s-cluster/master.yml
$ kubectl get nodes
```
### 5. Setting Up the Worker Nodes
```bash
$ ansible-playbook -i hosts /home/kubeuser/k8s-cluster/nodes.yml
```
### 6. Verifying the Cluster
```bash
$ kubectl get nodes
```
### 7. Running An Application on the Cluster
```bash
$ kubectl create deployment nginx --image=nginx
$ kubectl expose deploy nginx --port 80 --target-port 80 --type NodePort
```
## Others
error port was in use.
``` bash
sudo kill -9 `sudo lsof -t -i:10250`

journalctl -xeu kubelet
```
