# Steps Only

- First have an application
- Second you need to have apache server running on docker, for that you need to write the Dockerfile
- Third, you need to go with kubernetes
  - For kubernetes, you need to install minikub, refer to documentation and install.
    ```
    minikube start --driver=qemu --network ...
    ```
  - Create a folder with name KBS and within th4 older you need to create a file **manifest**, and within that you need to create a yaml file with name *deployment.yaml* and *service.yaml*, you can get the configuration for both the yaml file from the documentation.
  - Use the command for listing all the objects created in the cluster.
    ```
    kubectl get all
    ```
  - Use this command to  `kubctl apply -f KBS/manfest/deployment.yaml` do same for service.yaml and check whether it is created or not.

  - There are only few steps that you  need to create in order to deloy, after the kubernetes, you need to start with automation on the github.

  - *There is something called **Jobs***, didn't fully got what it is,  but **repeatition**.

  - The last two steps involves in the devops is the continous integration and contineous deplyment, where there is no human intervention and therefore,
    - **GitHub Actions** - For Continous integration.
    - **ArgoCD** - For Continous Deployment and ths removes the human intervention.


    