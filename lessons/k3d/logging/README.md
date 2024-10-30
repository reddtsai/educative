# Logging

The Logging operator solves your logging-related problems in Kubernetes environments by automating the deployment and configuration of a Kubernetes logging pipeline.

> Chart Version 104.1.2+up4.8.0

## Install

### Install With Rancher

1. Log in Rancher.
2. Goto 「Cluster Management」, Into 「Clusters」, Find the cluster you want to enable Logging and click「Explore」.
3. Goto 「Apps」, Into 「Charts」, click「Logging」.
4. Click「Install」.

## Loki

```
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
helm install --values values.yaml loki --namespace=loki grafana/loki
```

```
helm show values grafana/loki-stack > ~/loki-stack-values.yaml
```

## Log

```
kubectl logs -n reddservice -l app=auth
```
