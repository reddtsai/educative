MANAGEMENT_CLUSTER_NAME=k8s-management
DEVELOPER_CLUSTER_NAME=k8s-developer
CURRENT_CLUSTER_NAME=k3d-$(MANAGEMENT_CLUSTER_NAME)

.PHONY: install-rancher
install-rancher: k8s-management-context
	@helm repo add jetstack https://charts.jetstack.io
	@helm repo add rancher-latest https://releases.rancher.com/server-charts/latest
	@helm repo update
	@kubectl create namespace cert-manager
	@kubectl apply -f cert-manager.crds.yaml
	@helm install cert-manager jetstack/cert-manager --namespace cert-manager
	@kubectl create namespace cattle-system
	@helm install rancher rancher-latest/rancher --namespace cattle-system \
	--set hostname=rancher.192.168.1.110.sslip.io \
	--set replicas=1 \
	--set bootstrapPassword=1qaz2wsx

.PHONY: k8s-management-context
k8s-management-context:
	@kubectl config use-context k3d-$(MANAGEMENT_CLUSTER_NAME)

.PHONY: k8s-developer-context
k8s-developer-context:
	@kubectl config use-context k3d-$(DEVELOPER_CLUSTER_NAME)

.PHONY: k8s-context
k8s-context:
	@kubectl config use-context $(CURRENT_CLUSTER_NAME)

.PHONY: ip-address
ipadress:
	@ifconfig | grep inet

# ports is 30000-32767
.PHONY: install-ingress
install-ingress: k8s-developer-context
	helm repo add proxy https://kubernetes.github.io/ingress-nginx
	helm repo update
	helm install nginx-ingress ingress-nginx/ingress-nginx \
  		--set controller.service.type=NodePort \
  		--set controller.service.nodePorts.http=30080 \
  		--set controller.ingressClassResource.name=nginx \
  		--set controller.ingressClassResource.default=false

.PHONY: uninstall-ingress
uninstall-ingress: k8s-developer-context
	helm uninstall nginx-ingress