# Argo

Open source tools for Kubernetes to run workflows, manage clusters, and do GitOps right.

## Argo CD

Install

Helm

```
# CLI
brew install argocd
# Argo
helm repo add argo https://argoproj.github.io/argo-helm
helm install argocd argo/argo-cd -n argocd --create-namespace
```

Kustomization (Istio)

```
istioctl install --skip-confirmation
kubectl label namespace default istio-injection=enabled
kubectl apply -k ./ -n default --wait=true
```

Login Password

argocd admin initial-password -n argocd
