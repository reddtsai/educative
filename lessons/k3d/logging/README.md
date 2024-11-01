# Logging

The Logging operator solves your logging-related problems in Kubernetes environments by automating the deployment and configuration of a Kubernetes logging pipeline.

## Install

### Install With Rancher

1. Log in Rancher.
2. Goto 「Cluster Management」, Into 「Clusters」, Find the cluster you want to enable Logging and click「Explore」.
3. Goto 「Apps」, Into 「Charts」, click「Logging」.
4. Click「Install」.

> Chart Version 104.1.2+up4.8.0

### Install With Helm

```
kubectl create namespace logging
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm upgrade --install --wait --namespace logging monitor prometheus-community/kube-prometheus-stack \
    --set "grafana.dashboardProviders.dashboardproviders\\.yaml.apiVersion=1" \
    --set "grafana.dashboardProviders.dashboardproviders\\.yaml.providers[0].orgId=1" \
    --set "grafana.dashboardProviders.dashboardproviders\\.yaml.providers[0].type=file" \
    --set "grafana.dashboardProviders.dashboardproviders\\.yaml.providers[0].disableDeletion=false" \
    --set "grafana.dashboardProviders.dashboardproviders\\.yaml.providers[0].options.path=/var/lib/grafana/dashboards/default" \
    --set "grafana.dashboards.default.logging.gnetId=7752" \
    --set "grafana.dashboards.default.logging.revision=5" \
    --set "grafana.dashboards.default.logging.datasource=Prometheus" \
    --set "prometheus.prometheusSpec.serviceMonitorSelectorNilUsesHelmValues=False"
helm upgrade --install --wait --namespace logging logging-operator oci://ghcr.io/kube-logging/helm-charts/logging-operator
kubectl -n logging create secret generic logging-s3 \
    --from-literal=accesskey='AKIAIOSFODNN7EXAMPLE' \
    --from-literal=secretkey='wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY'
kubectl apply -f demo
helm upgrade --install --wait --namespace logging log-generator oci://ghcr.io/kube-logging/helm-charts/log-generator

```

## Log

```
kubectl logs -n reddservice -l app=auth
```

http://localhost:3000

```
kubectl -n logging port-forward svc/monitor-grafana 3000:80
```

http://localhost:9090

```
kubectl -n logging port-forward svc/monitor-kube-prometheus-st-prometheus 9090:9090
```
