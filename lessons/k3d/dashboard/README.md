# Dashboard

## Install

### Install With Helm

```
helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
helm repo update
kubectl create namespace kubernetes-dashboard
helm install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard --namespace kubernetes-dashboard
```

Create a ServiceAccount and ClusterRoleBinding

```
kubectl create serviceaccount -n kubernetes-dashboard admin-user
kubectl create clusterrolebinding -n kubernetes-dashboard admin-user --clusterrole cluster-admin \
    --serviceaccount=kubernetes-dashboard:admin-user
```

Open your browser and access Dashboard at https://localhost:8443

```
kubectl -n kubernetes-dashboard create token admin-user
kubectl -n kubernetes-dashboard port-forward svc/kubernetes-dashboard-kong-proxy 8443:443
```
