
# Google Cloud Infrastructure project

A brief description of what this project does and who it's for

## Tools Used

<p align="center">
<a href="https://www.terraform.io/" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/AbdEl-RahmanKhaled/AbdEl-RahmanKhaled/main/icons/terraform/terraform-original-wordmark.svg" alt="terraform" width="40" height="40"/> </a> <a href="https://cloud.google.com" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/AbdEl-RahmanKhaled/AbdEl-RahmanKhaled/main/icons/googlecloud/googlecloud-original.svg" alt="gcp" width="40" height="40"/> </a> <a href="https://kubernetes.io" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/AbdEl-RahmanKhaled/AbdEl-RahmanKhaled/main/icons/kubernetes/kubernetes-icon.svg" alt="kubernetes" width="40" height="40"/> </a> <a href="https://www.python.org" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/AbdEl-RahmanKhaled/AbdEl-RahmanKhaled/main/icons/python/python-original.svg" alt="python" width="40" height="40"/> </a> <i class="fas fa-user"></i>
</p>

![agent](https://github.com/Badawi02/GCP_Infrastructure_Project/blob/main/images/MicrosoftTeams-image.png)

### Project Details:

 - Infrastructure as code using Terraform that builds an environment on the google cloud platform
 - Dockerizing a Simple Python app
 - Deploy the app with Kubernetes 

### Getting Started

- Download The Code

```bash
  git clone https://github.com/Badawi02/GCP_Project.git
```
- Setup your GCP account, create new project and change the value of "project_name" variable
- Build the Infrastructure
```bash
  terraform init
```
```bash
  terraform apply
```
Now you can check your GCP account, you can see this resources has been created:
- VPC named "vpc-network".
- 2 Subnets "management-subnet", "restricted-subnet".
- Service Account used by the K8S cluster and the management VM.
- Nat in "management-subnet".
- Private Virtual Machine in "management-subnet" subnet to manage the cluster.
- Private Kubernetes cluster in "restricted-subnet" with 2 worker nodes.

```bash
        # NOTE
        Only VMs in "management-sub" subnet can access the Kubernetes cluster.
```


## Deploying Jenkins as pod on kubernates :
- first, SSH to the management "management-VM"
- Build Dockerfile for image master and slave
- deploy pods for master pod and slave pod
- Run 
```bash
    kubectl apply -f <yourfile>.YML
```


## Make pipleline :
- cofigure the pipe line to get code from github
- and make the stages that write at jenkinsfile on slave
- congiure slave for can connect with master 


## Build and push the Python Docker Image to Docker Hub with jenkins :
- Build the Python app Docker Image.
```bash
    docker build -t <username>/python_app . Dockerfile
    docker push <username>/python_app
```

## Deploying app to Kubernetes with jenkins :
- first, SSH to the management "management-VM"
- Install the Kubectl tool to manage the Kubernetes cluster.
- go to K8S Folder and copy the content of each YML file to the management-VM
- Run 
```bash
    kubectl apply -f <yourfile>.YML
```
That will deploy:
- Config Map for environment variables used by demo app
- Redis Deployment and Exopse the Deployment with ClusterIP service
- Python App Deployment and Exopse it with NodePort service
- You can show all resources of cluster
```bash
    kubectl get all -o wide
```
Now, you can access the Python App by hitting the Loadbalancer (External IP) 

## ScreenShots :
----------------------------------------------------------------
![agent](https://github.com/Badawi02/GCP_Infrastructure_Project/blob/main/images/1.png)
-----------------------------------------------------------------
-----------------------------------------------------------------
![agent](https://github.com/Badawi02/GCP_Infrastructure_Project/blob/main/images/2.png)
-----------------------------------------------------------------
-----------------------------------------------------------------
![agent](https://github.com/Badawi02/GCP_Infrastructure_Project/blob/main/images/3.png)
-----------------------------------------------------------------
-----------------------------------------------------------------
![agent](https://github.com/Badawi02/GCP_Infrastructure_Project/blob/main/images/4.png)
-----------------------------------------------------------------
-----------------------------------------------------------------
![agent](https://github.com/Badawi02/GCP_Infrastructure_Project/blob/main/images/5.png)
-----------------------------------------------------------------
-----------------------------------------------------------------
![agent](https://github.com/Badawi02/GCP_Infrastructure_Project/blob/main/images/6.png)
-----------------------------------------------------------------
-----------------------------------------------------------------
![agent](https://github.com/Badawi02/GCP_Infrastructure_Project/blob/main/images/7.png)
-----------------------------------------------------------------
-----------------------------------------------------------------
![agent](https://github.com/Badawi02/GCP_Infrastructure_Project/blob/main/images/8.png)
-----------------------------------------------------------------
-----------------------------------------------------------------
![agent](https://github.com/Badawi02/GCP_Infrastructure_Project/blob/main/images/9.png)

## Contributors:
- [Ahmed Badawi](https://github.com/Badawi02)
