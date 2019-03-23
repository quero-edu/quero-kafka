#!/bin/bash
echo "Fetching files from remote repository..."
mkdir -p $HOME/.kafka
cd $HOME/.kafka
git clone https://github.com/quero-edu/quero-kafka.git
chmod +x kafka-up

echo "Adding executable to path..."
echo 'export PATH=${PATH}:${HOME}/.kafka' >>  $HOME/.bashrc
source $HOME/.bashrc

echo "Installing kafkacat..."
sudo apt-get -y install kafkacat

echo "Configuring docker network"
docker network create querobolsa_default || true

echo "Done! Run 'kafka-up' and enjoy Kafka!"

