#bin/bash
git config --global user.name "mkjaws2021"
git config --global user.email "mkj.aws2021@gmail.com"

echo alias kga=\'kubectl get all -o wide\' >> ~/.bashrc 
echo alias kgd=\'kubectl get deployments -o wide\'>> ~/.bashrc
echo alias kgp=\'kubectl get pods -o wide\'>> ~/.bashrc
echo alias kgn=\'kubectl get namespace\'>> ~/.bashrc
echo alias kgr=\'kubectl get replicaset -o wide\'>> ~/.bashrc
echo alias kgsvc=\'kubectl get services\'>> ~/.bashrc
#source ~/.bashrc
alias brc='source ~/.bashrc'
cd ~/k8s/
