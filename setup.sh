#! /usr/bin/bash

curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

sudo apt-add-repository ppa:mmk2410/intellij-idea
sudo apt update
sudo apt install -y spotify-client \
    install intellij-idea-community \
    nemo

# install and setup auto-complete for minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
minikube completion bash | sudo tee /etc/bash_completion.d/minikube >/dev/null && source "$HOME/.bashrc"

# set nemo as default file manager
xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search
