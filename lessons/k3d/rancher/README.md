# Rancher

Rancher is a Kubernetes management tool to deploy and run clusters anywhere and on any provider.

> Version 2.9.3

## Install

Install Rancher with Helm.

```
make install-rancher
```

First log in.

```
# 登錄 admin/1qaz2wsx
https://rancher.<HOST_IP>.sslip.io:8443
# 首次登錄，會提示設定 Rancher Server URL，設為下方 url
https://rancher.<HOST_IP>.sslip.io:8443
```

> GET HOST IP `ifconfig | grep inet`，避免和本機 port 443 衝突，設為 8443

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
