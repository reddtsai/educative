# Fluent

## Fluent Bit

### Install With Helm

```
helm repo add fluent https://fluent.github.io/helm-charts
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
kubectl create namespace logging
kubectl create namespace monitoring
helm upgrade --install --wait --namespace monitoring prometheus prometheus-community/kube-prometheus-stack
helm install --namespace logging --values loki-scalable.yaml loki grafana/loki
helm upgrade --install --namespace logging --values values.yaml fluent-bit fluent/fluent-bit
```

Dashboard

```
helm repo update
kubectl create namespace kube-dashboard
helm install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard --namespace kube-dashboard
kubectl create serviceaccount -n kube-dashboard admin-user
kubectl create clusterrolebinding -n kube-dashboard admin-user --clusterrole cluster-admin \
    --serviceaccount=kube-dashboard:admin-user
kubectl -n kube-dashboard create token admin-user
kubectl -n kube-dashboard port-forward svc/kubernetes-dashboard-kong-proxy 8888:443
```
