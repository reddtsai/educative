# k3d

[Refence](https://k3d.io/v5.0.0/)

## Rancher

https://rancher.<HOST_IP>.nip.io:44380

本地安裝

```
make create-cluster
make install-rancher
```

第一次進入 Rancher

```
# 登錄 admin/1qaz2wsx
https://rancher.<HOST_IP>.nip.io:8443
# 首次登錄，會提示設定 Rancher Server URL，設為下方 url
https://rancher.<HOST_IP>.nip.io:8443
```

> GET HOST IP `ifconfig | grep inet`

添加一個 cluster 到 rancher

```
# browser 登錄 rancher
cluster management => import existing => Generic => 輸入資訊
# kubernetes cli
# switch to 要加入管理的 cluster
kubectl config use-context <cluster name>
# apply rancher agent 到 <cluster name>
kubectl apply -f https://rancher.<HOST_IP>.nip.io:8443/v3/import/rcwqgfbqzltgfkfhqwd8qtzhwqk85n4td4xl6q6hqrnkgqnjrhjbnj_c-m-4vlr229q.yaml

```

> 如有連線上的問題，可先下載，執行 kubectl apply -f rancher_agent.yaml

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
