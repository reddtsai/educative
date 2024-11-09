# Label

Labels are key/value pairs that are attached to objects such as Pods.

Basic

```
kubectl run kuard --image=gcr.io/kuar-demo/kuard-amd64:1 --replicas=3 --labels="ver=2,app=alpaca,env=prod"
kubectl get deployments --show-labels
kubectl label deployments kuard "canary=true"
kubectl get deployments -L canary
kubectl label deployments kuard "canary-"
kubectl get pods --selector="ver=2"
```
