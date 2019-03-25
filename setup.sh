#!/bin/bash
set -e

if [ -d "$HOME/.kafka/quero-kafka" ]; then
  echo "Kafka local environment already installed. If you want to reinstall it, delete the '.kafka/quero-kafka' directory"
  exit 0
fi

echo "Fetching files from remote repository..."
mkdir -p $HOME/.kafka
cd $HOME/.kafka
git clone https://github.com/quero-edu/quero-kafka.git
cd $HOME/.kafka/quero-kafka
chmod +x kafkaup

echo "Adding executable to path..."
grep -qxF 'quero-kafka' $HOME/.bashrc || echo "export PATH=\$PATH:$HOME/.kafka/quero-kafka" >>  $HOME/.bashrc
source $HOME/.bashrc
if [[ -e .zshrc ]]
then
  grep -qxF 'quero-kafka' $HOME/.zshrc || echo "export PATH=\$PATH:$HOME/.kafka/quero-kafka" >>  $HOME/.zshrc
  source $HOME/.zshrc
fi


echo "Installing kafkacat..."
sudo apt-get -y install kafkacat

echo "Configuring docker network"
docker network create querobolsa_default || true

echo "Done! Run 'kafkaup' and enjoy Kafka!"

