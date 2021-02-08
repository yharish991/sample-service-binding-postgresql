install-service-binding-operator:
	kubectl create -f https://raw.githubusercontent.com/yharish991/service-binding-operator/master/deploy/crds/operators.coreos.com_servicebindings_crd.yaml
	kubectl create -f https://raw.githubusercontent.com/yharish991/service-binding-operator/master/deploy/role.yaml
	kubectl create -f https://raw.githubusercontent.com/yharish991/service-binding-operator/master/deploy/role_binding.yaml
	kubectl create -f https://raw.githubusercontent.com/yharish991/service-binding-operator/master/deploy/cluster_role.yaml
	kubectl create -f https://raw.githubusercontent.com/yharish991/service-binding-operator/master/deploy/cluster_role_binding.yaml
	kubectl create -f https://raw.githubusercontent.com/yharish991/service-binding-operator/master/deploy/service_account.yaml
	kubectl create -f https://raw.githubusercontent.com/yharish991/service-binding-operator/master/deploy/operator.yaml
	
install-postgresql-db-operator:
	kubectl apply -f ./manifests/os.cr.yaml
#	kubectl apply -f ./manifests/postgresql-operator-subscription.yaml

create-postgresql-db-instance:
	kubectl apply -f ./manifests/create-postgresql-db-instance.yaml

deploy-application:
	kubectl apply -f deployment.yaml

bind-postgresql-to-application:
	kubectl apply -f ./manifests/bind-postgresql-to-application.yaml	
