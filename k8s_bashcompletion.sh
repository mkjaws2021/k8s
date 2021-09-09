"#!/bin/bash
get_distribution() {
        lsb_dist=""
        # Every system that we officially support has /etc/os-release
        if [ -r /etc/os-release ]; then
                lsb_dist="$(. /etc/os-release && echo "$ID")"
        fi
        # Returning an empty string here should be alright since the
        # case statements don't act unless you provide an actual value
        echo "$lsb_dist"
}

lsb_dist=$( get_distribution )
lsb_dist="$(echo "$lsb_dist" | tr '[:upper:]' '[:lower:]')"
echo $lsb_dist

case "$lsb_dist" in
  ubuntu) 
           apt-get install bash-completion -y 
           /bin/bash -c 'source /usr/share/bash-completion/bash_completion'
           /bin/bash -c 'source <(kubectl completion bash)' >>~/.bashrc
           echo 'alias k=kubectl' >>~/.bashrc
           echo 'alias kgp=\"kubectl get pods -o wide --show-labels\"' >>~/.bashrc
           echo 'alias kgd=\"kubectl get deployments -o wide --show-labels\"' >>~/.bashrc
           echo 'complete -F __start_kubectl k' >>~/.bashrc
           /bin/bash -c 'source ~/.bashrc'
  ;;
  centos)  sudo yum install bash-completion -y  
           /bin/bash -c 'source /usr/share/bash-completion/bash_completion'
           /bin/bash -c 'source <(kubectl completion bash)' >>~/.bashrc
           echo 'alias k=kubectl' >>~/.bashrc
           echo 'alias kgp=\"kubectl get pods -o wide --show-labels\"' >>~/.bashrc
           echo 'alias kgd=\"kubectl get deployments -o wide --show-labels\"' >>~/.bashrc
           echo 'complete -F __start_kubectl k' >>~/.bashrc
           /bin/bash -c 'source ~/.bashrc'
  ;;
  
esac 
