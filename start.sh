#!/bin/bash

if [[ ! -z $KUBECONFIG ]]
then
  echo "Setting up kubeconfig..."
  mkdir ~/.kube/
  echo "$KUBECONFIG" > ~/.kube/config
  echo "Verifing kubectl access..."
  if kubectl cluster-info
  then
    echo "OK"
  else
    echo "Failed."
    exit 2
  fi
fi

bash ./build.sh

