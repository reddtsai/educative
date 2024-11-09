# Service

Expose an application running in your cluster behind a single outward-facing endpoint, even when the workload is split across multiple backends.

Basic

```
kubectl run kuard --image=gcr.io/kuar-demo/kuard-amd64:1 --replicas=3 --port=8080
kubectl expose deployment kuard
```
