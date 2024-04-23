#!/bin/bash

# Configurar para usar o Minikube
echo "Configurando para usar o Minikube..."
minikube docker-env
eval $(minikube docker-env)

# Criar serviços no cluster Minikube
echo "Criando serviços no cluster Minikube..."
kubectl apply -f ./services.yml

# Fazer o Deployment no cluster Minikube
echo "Fazendo o Deployment no cluster Minikube..."
kubectl apply -f ./deployment.yml