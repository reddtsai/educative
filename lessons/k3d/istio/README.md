# Istio

Istio is an open source service mesh that layers transparently onto existing distributed applications. Istio’s powerful features provide a uniform and more efficient way to secure, connect, and monitor services. Istio is the path to load balancing, service-to-service authentication, and monitoring – with few or no service code changes.

> Chart Version 104.4.0+up1.22.1

## Install

Sidecar Mode

### Install With Rancher

1. Log in Rancher.
2. Goto 「Cluster Management」, Into 「Clusters」, Find the cluster you want to enable Istio and click「Explore」.
3. Goto 「Apps」, Into 「Charts」, click「Istio」.
4. You will be prompted to install the rancher-monitoring app.
5. Click「Install」.
6. Enabled istio-injection.
   ```
   kubectl label namespace <your-namespace> istio-injection=enabled
   ```

要排除 Istio sidecar 被注入某工作负载，请在工作负载上使用以下注释：

```
sidecar.istio.io/inject: "false"
```

### Install With Helm

```
kubectl create namespace istio-system
helm install istio-base istio/base -n istio-system --wait
helm install istiod istio/istiod -n istio-system --wait
# Optional
helm install istio-ingressgateway istio/gateway -n istio-system --wait
```

Kubernetes Gateway API CRDs

```
kubectl get crd gateways.gateway.networking.k8s.io &> /dev/null || \
  { kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.2.0/standard-install.yaml; }
```

### Install With Istioctl

```
istioctl install -f profile.yaml
```

## Demo

```
istioctl install -f demo-profile-no-gateways.yaml -y
kubectl label namespace default istio-injection=enabled
kubectl apply -f standard-install.yaml
kubectl apply -f bookinfo.yaml
kubectl apply -f bookinfo-gateway.yaml
kubectl annotate gateway bookinfo-gateway networking.istio.io/service-type=ClusterIP --namespace=default
kubectl port-forward svc/bookinfo-gateway-istio 8080:80
```

Open your browser and navigate to http://localhost:8080/productpage

```
kubectl get services
kubectl get pods
kubectl get gateway
```

## Addons

```
kubectl apply -f addons
kubectl rollout status deployment/kiali -n istio-system
```

### Kiali

在 Kiali 仪表板中，你可以查看每个命名空间的图。Kiali 图提供了一种强大的方式来可视化 Istio 服务网格的拓扑。

登入 Token

```
istioctl dashboard kiali

kubectl -n istio-system create token <kiali service name>
```
