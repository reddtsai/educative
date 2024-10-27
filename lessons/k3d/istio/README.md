# Istio

Istio is an open source service mesh that layers transparently onto existing distributed applications. Istio’s powerful features provide a uniform and more efficient way to secure, connect, and monitor services. Istio is the path to load balancing, service-to-service authentication, and monitoring – with few or no service code changes.

# Install

透過 Rancher 安裝

1. Log in Rancher.
2. Goto 「Cluster Management」, Into 「Clusters」, Find the cluster you want to enable Istio and click「Explore」.
3. Goto 「Apps」, Into 「Charts」, click「Istio」.
4. You will be prompted to install the rancher-monitoring app.
5. click「Install」.

# Kiali

在 Kiali 仪表板中，你可以查看每个命名空间的图。Kiali 图提供了一种强大的方式来可视化 Istio 服务网格的拓扑。

登入 Token

```
kubectl get service --all-namespaces
kubectl -n istio-system create token <kiali service name>
```
