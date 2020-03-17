## sample-service-binding-postgresql

This sample demonstrates on how to bind a PostreSQL database that is managed by an operator to a Spring boot application deployed and managed by Runtime Component Operator using Service Binding Operator.

In this sample, actions are performed by users in two roles:
* Cluster Admin - Installs the necessary operators to the cluster for this sample.
* Application Developer - Deploys the application, creates a DB instance and binds the database to application.

Cluster Admin needs to install the following operators into the cluster:
* Service Binding Operator
* Runtime Component Operator
* PostgreSQL Database operator 

## Install Service Binding Operator

Install the Service Binding Operator with the following command as Cluster Admin.

```
make install-service-binding-operator
```

## Install PostgreSQL Operator

Install the PostgreSQL Operator with the following command as Cluster Admin.

```
make install-postgresql-db-operator
```


## Install Runtime Component Operator

Install the Runtime Component Operator with the following command as Cluster Admin.

```
make install-runtime-component-operator
```


## Create PostgreSQL database instance

Create an instance of the PostgreSQL db with the following command as an Application Developer.

```
make create-postgresql-db-instance
```

This should create a secret `demo-database-postgresql` and a configmap `demo-database` that has all the necessary information to connect to the database.


## Deploy the application

Before you deploy the application, build and push the docker image to any image registry.


* To build the docker image:

```
docker build -t mynamespace/myrepository[:tag] .
```


* To push the docker image:

```
docker push mynamespace/myrepository[:tag]
```

* Change the `applicationImage` value in the `app-deploy.yaml` to the image that has been pushed to the registry.

* Now deploy the application with the following command as Application Developer.

```
make deploy-application
```

## Bind Postgresql database to deployed application

Now express the intent to bind the Postgresql database to the deployed application with the following command as Application Developer.

```
make bind-postgresql-to-application
```

After you run the above command you should see a intermediate secret created with name `service-binding` which has all the information that is necessary to connect to the Postgresql database.

This sample Spring boot application acquires the Secrets via K8s volume mounts and this is done use Spring Cloud Kubernetes(SCK). Check app-deploy.yaml for info on volumes and volumeMounts.


## Test

If you are using Openshift, run the following command to get the host/port information of the route

```
oc get route sample-service-binding-postgresql
```

To access the application sample endpoint 

```
curl http://<<host>>:<<port>>/rest/v1/books
```

