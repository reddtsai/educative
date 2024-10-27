# K3D

k3d is a lightweight wrapper to run k3s (Rancher Lab’s minimal Kubernetes distribution) in docker.

## Install

Use homebrew to install k3d in Mac.

```
brew install k3d
```

Create a cluster

```
make create-cluster
```

## Argo

```
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
helm install argo-cd argo/argo-cd --namespace argocd --create-namespace
kubectl get pods -n argocd
```

## COMMAND

kubectl

```
kubectl config view
kubectl get node
kubectl get namespace
kubectl get pod -n <namespace>
kubectl get ingress -n <namespace>
kubectl describe ingress <ingress> -n <namespace>
kubectl logs <pod> -n <namespace>
```

helm

```
helm search repo
helm install
helm get values <repo> -n <namespace>
```

## DNS

nip.io
sslip.io

## IP

| http | https |
| ---- | ----- |
| 8080 | 8443  |
| 9080 | 9443  |
| 9081 |       |
