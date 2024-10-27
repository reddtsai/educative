MANAGEMENT_CLUSTER_NAME=k8s-management
DEVELOPER_CLUSTER_NAME=k8s-developer
CURRENT_CLUSTER_NAME=k3d-$(MANAGEMENT_CLUSTER_NAME)

.PHONY: create-cluster
create-cluster:
	@k3d cluster create $(MANAGEMENT_CLUSTER_NAME) --agents 1 --port 8080:80@loadbalancer --port 8443:443@loadbalancer 
	@k3d cluster create $(DEVELOPER_CLUSTER_NAME) --agents 1 --port 9080:80@loadbalancer --port 9443:443@loadbalancer 

.PHONY: delete-cluster
delete-cluster:
	@k3d cluster delete $(MANAGEMENT_CLUSTER_NAME)
	@k3d cluster delete $(DEVELOPER_CLUSTER_NAME)

.PHONY: k8s-management-context
k8s-management-context:
	@kubectl config use-context k3d-$(MANAGEMENT_CLUSTER_NAME)

.PHONY: k8s-developer-context
k8s-developer-context:
	@kubectl config use-context k3d-$(DEVELOPER_CLUSTER_NAME)

.PHONY: k8s-context
k8s-context:
	@kubectl config use-context $(CURRENT_CLUSTER_NAME)

.PHONY: k8s-namespaces
k8s-namespaces: k8s-context
	@kubectl get namespaces

.PHONY: ip-address
ipadress:
	@ifconfig | grep inet
