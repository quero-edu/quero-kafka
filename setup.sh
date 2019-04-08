#!/bin/bash
set -e

is_mac=false
if [ "$(uname)" == "Darwin" ]; then
  echo 'mac variable set'
  is_mac=true
fi


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
grep 'quero-kafka' $HOME/.bashrc || echo "export PATH=\$PATH:$HOME/.kafka/quero-kafka" >>  $HOME/.bashrc

if [[ -e $HOME/.zshrc ]]
then
  grep 'quero-kafka' $HOME/.zshrc || echo "export PATH=\$PATH:$HOME/.kafka/quero-kafka" >>  $HOME/.zshrc
fi

#!/usr/bin/env bash

echo "Adding DATA_PATH variable"

if [ "$is_mac" = true ]; then
  echo "export DATA_PATH=/private/var/data" >>  $HOME/.bashrc
  if [[ -e $HOME/.zshrc ]]; then
    echo "export DATA_PATH=/private/var/data" >>  $HOME/.zshrc
  fi
else
    echo "export DATA_PATH=/var/data" >>  $HOME/.bashrc
fi

echo "rebuild bashrc"

source $HOME/.bashrc


echo "Installing kafkacat..."
if [ "$is_mac" = true ]; then
  brew install kafkacat
else
  sudo apt-get -y install kafkacat
fi


echo "Configuring docker network"
docker network create querobolsa_default || true

echo "Done! Run 'kafkaup' and enjoy Kafka!"
