# K3D

k3d is a lightweight wrapper to run k3s (Rancher Lab’s minimal Kubernetes distribution) in docker.

> k3d version v5.7.4

> k3s version v1.30.4-k3s1 (default)

## Install

Use homebrew to install k3d in Mac.

```
brew install k3d
```

Create a cluster

```
make create-cluster
```

Disable Traefik

```
--k3s-arg '--disable=traefik@server:*'
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
