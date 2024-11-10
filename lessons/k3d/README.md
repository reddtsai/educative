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

## Wildcard Domain

nip.io
sslip.io

## Reference

[K3S](https://docs.k3s.io/)

[K3D](https://k3d.io/v5.0.0/)
