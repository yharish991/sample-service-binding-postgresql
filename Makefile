install-service-binding-operator:
	kubectl apply -f ./manifests/csc.cr.yaml
	kubectl apply -f ./manifests/service-binding-operator-subscription.yaml
	
install-postgresql-db-operator:
	kubectl apply -f ./manifests/os.cr.yaml
	kubectl apply -f ./manifests/postgresql-operator-subscription.yaml
	
install-runtime-component-operator:
	kubectl create -f https://raw.githubusercontent.com/application-stacks/runtime-component-operator/master/deploy/crds/app.stacks_runtimecomponents_crd.yaml
	kubectl create -f https://raw.githubusercontent.com/application-stacks/runtime-component-operator/master/deploy/service_account.yaml
	kubectl create -f https://raw.githubusercontent.com/application-stacks/runtime-component-operator/master/deploy/role.yaml
	kubectl create -f https://raw.githubusercontent.com/application-stacks/runtime-component-operator/master/deploy/role_binding.yaml
	kubectl create -f https://raw.githubusercontent.com/application-stacks/runtime-component-operator/master/deploy/operator.yaml
	
deploy-application:
	kubectl apply -f app-deploy.yaml
	
create-postgresql-db-instance:
	kubectl apply -f ./manifests/create-postgresql-db-instance.yaml
	
bind-postgresql-to-application:
	kubectl apply -f ./manifests/bind-postgresql-to-application.yaml	
