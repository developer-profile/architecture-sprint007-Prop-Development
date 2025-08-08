#!/bin/bash

kubectl create namespace net-demo
kubectl config set-context --current --namespace=net-demo

kubectl run front-end-app --image=nginx --labels role=front-end --expose --port=80
kubectl run back-end-api-app --image=nginx --labels role=back-end-api --expose --port=80
kubectl run admin-front-end-app --image=nginx --labels role=admin-front-end --expose --port=80
kubectl run admin-back-end-api-app --image=nginx --labels role=admin-back-end-api --expose --port=80

kubectl label pod front-end-app role=front-end --overwrite
kubectl label pod back-end-api-app role=back-end-api --overwrite
kubectl label pod admin-front-end-app role=admin-front-end --overwrite
kubectl label pod admin-back-end-api-app role=admin-back-end-api --overwrite

kubectl get pod front-end-app --show-labels
kubectl get pod back-end-api-app --show-labels
kubectl get pod admin-front-end-app --show-labels
kubectl get pod admin-back-end-api-app --show-labels