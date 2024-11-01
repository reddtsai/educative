# Monitoring

Alerting、Prometheus and Grafana.

## Install

### Install With Rancher

1. Log in Rancher.
2. Goto 「Cluster Management」, Into 「Clusters」, Find the cluster you want to enable Monitoring and click「Explore」.
3. Goto 「Apps」, Into 「Charts」, click「Monitoring」.
4. Click「Install」.

> 确保 cattle-monitoring-system 命名空间位于 System 项目中

> Chart Version 104.1.2+up57.0.3

### Install With Helm

```
kubectl create namespace monitoring
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm upgrade --install --wait --namespace monitoring monitor prometheus-community/kube-prometheus-stack \
    --set "grafana.dashboardProviders.dashboardproviders\\.yaml.apiVersion=1" \
    --set "grafana.dashboardProviders.dashboardproviders\\.yaml.providers[0].orgId=1" \
    --set "grafana.dashboardProviders.dashboardproviders\\.yaml.providers[0].type=file" \
    --set "grafana.dashboardProviders.dashboardproviders\\.yaml.providers[0].disableDeletion=false" \
    --set "grafana.dashboardProviders.dashboardproviders\\.yaml.providers[0].options.path=/var/lib/grafana/dashboards/default" \
    --set "grafana.dashboards.default.logging.gnetId=7752" \
    --set "grafana.dashboards.default.logging.revision=5" \
    --set "grafana.dashboards.default.logging.datasource=Prometheus" \
    --set "prometheus.prometheusSpec.serviceMonitorSelectorNilUsesHelmValues=False"

```

## Grafana

用户名和密码是 admin/prom-operator。

## Prometheus
