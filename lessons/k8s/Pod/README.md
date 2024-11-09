# Pod

Pods are the smallest deployable units of computing that you can create and manage in Kubernetes.

Basic

```
kubectl run -d --name kuard --publish 8080:8080 gcr.io/kuar-demo/kuard-amd64:1
kubectl get pods
kubectl delete deployments/kuard
```

Manifest

```
kubectl apply -f manifest.yaml
```

Port Forward

```
kubectl port-forward kuard 8080:8080
```
