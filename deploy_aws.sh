#!/bin/bash

# Construindo a imagem do backend
docker build -t tecnicocefet/projeto-backend:1.0 backend/.

# Construindo a imagem do banco de dados
docker build -t tecnicocefet/projeto-database:1.0 database/.

# Realizando o push das imagens para o Docker Hub
echo "Realizando o push das imagens..."
docker push tecnicocefet/projeto-backend:1.0
docker push tecnicocefet/projeto-database:1.0

# Aplicando serviços no cluster Kubernetes
echo "Criando serviços no cluster Kubernetes..."
kubectl apply -f ./services.yml

# Realizando o deployment
echo "Fazendo o Deployment..."
kubectl apply -f ./deployment.yml
