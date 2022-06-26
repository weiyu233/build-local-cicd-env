#!/bin/bash
ansible-playbook -i hosts /home/kubeuser/k8s-cluster/initial.yml
ansible-playbook -i hosts /home/kubeuser/k8s-cluster/kube-dependencies.yml
ansible-playbook -i hosts /home/kubeuser/k8s-cluster/master.yml
kubectl get nodes
ansible-playbook -i hosts /home/kubeuser/k8s-cluster/nodes.yml
kubectl get nodes