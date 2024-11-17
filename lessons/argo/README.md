# Argo

Open source tools for Kubernetes to run workflows, manage clusters, and do GitOps right.

## Argo CD

Install

Helm

```
kubectl create namespace argocd
# use istio ingress
kubectl label namespace argocd istio-injection=enabled
helm repo add argo https://argoproj.github.io/argo-helm
helm install argocd argo/argo-cd -n argocd --values values.yaml
```

Kustomization (Istio)

```
# CLI
brew install argocd
istioctl install --skip-confirmation
# use istio ingress
kubectl label namespace default istio-injection=enabled
kubectl apply -k ./ -n default --wait=true
```

Login Password

argocd admin initial-password -n argocd
