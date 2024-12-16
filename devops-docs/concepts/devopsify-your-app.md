# Application

- First have an application or html file.\

# Docker

- Second Create the Dockerfile. 

  ```
  FROM httpd
  COPY index.html /usr/local/apache2/htdocs
  EXPOSE 80
  ```

- Build an image.

  ```
  docker image build -t mywebsite .
  # verify
  docker image ls
  ```
- Now make the account on the hub.docker and push the docker image.

  ```
  # create the docker hub image for that
  docker image tag <image-name> <account-name>/<image-name>

  # push the docker image
  docker image push <account-name>/<image-name>
  ```

# Kubernetes

- Third, you need to go with kubernetes
  - For kubernetes, you need to install minikub, refer to documentation and install.
    ```
    minikube start --driver=qemu --network socket_vmnet
    ```
  - Create a folder with name KBS and within th4 older you need to create a file **manifest**, and within that you need to create a yaml file with name *deployment.yaml* and *service.yaml*, you can get the configuration for both the yaml file from the documentation.

    ```
    # deployment.yaml
    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: nginx-deployment
      labels:
        app: nginx
    spec:
      replicas: 3
      selector:
        matchLabels:
          app: myapp
      template:
        metadata:
          labels:
            app: myapp
        spec:
          containers:
          - name: myapp
            image: utkarshpratapsingh/myapp
            ports:
            - containerPort: 80
    ```

  - Now create the service.yaml file.

    ```
    # service.yaml
    apiVersion: v1
    kind: Service
    metadata:
      name: myapp
    spec:
      type: Nodeport # to check ifservice is available outside the cluster
      selector:
        app.kubernetes.io/name: myapp 
      ports:
        - protocol: TCP
          port: 80
          targetPort: 80
    ``` 
  - Use the command for listing all the objects created in the cluster.
      ```
      kubectl get all
      ```
  - Use this command to  `kubctl apply -f KBS/manfest/deployment.yaml` do same for service.yaml and check whether it is created or not.

    ```
    kubctl apply -f KBS/manfest/deployment.yaml

    kubctl apply -f KBS/manfest/service.yaml
    ```

  - Check using `kubctl get all` to confirm whether they got created or not. Though you will find that service/myapp will be created, this is the cluster for your application that has provided you with IP and port number. Use the `<ip-address>:<port-number>` that minikub has provided and look for the result over the browser. 

    ```
    minikub ip
    ```  

# Helm

Now the deployment is done, website is deployed, but this kind of deployment can be difficult as we need a better solution to deploy it. We can have a better solution to deploy it using the helm chart. 

- Create a folder where your application is and create a helm.

```
# create directory
mkdir helm; cd helm

# create a helm
helm create myapp-chart
```

  - There are only few steps that you  need to create in order to deloy, after the kubernetes, you need to start with automation on the github.

  - *There is something called **Jobs***, didn't fully got what it is,  but **repeatition**.

  - The last two steps involves in the devops is the continous integration and contineous deplyment, where there is no human intervention and therefore,
    - **GitHub Actions** - For Continous integration.
    - **ArgoCD** - For Continous Deployment and ths removes the human intervention.


    