# OCI
The project is an implementation of the OCI (Oracle Cloud Infrastructure) services using Terraform. The project is implemented to be able to create the following resources:

- Infrastructure
    - VCN (Virtual Cloud Network)
    - Subnet
    - Internet Gateway

- Security
    - Route Table
    - Security List
    - Vault

- container Instance
- Kubernetes Enhanced Cluster
    - Bastion Host
    - Managed Node
        - 3 Deployments (Nginx, MariaDB, Wordpress)
        - 3 Pods (Nginx, MariaDB, Wordpress) with 3 replicas
        - 3 Services (Nginx, MariaDB, Wordpress)
        - 1 Storage Class (Block Volume)
            - 2 Persistent Volume Claims (Nginx, MariaDB, Wordpress) (Block Volume)  with data encryption
            - 2 Persistent Volumes (Nginx, MariaDB, Wordpress) (Block Volume)
        - 1 Storage Class (File Storage) with data encryption
            - 1 Persistent Volume Claim (Wordpress) (File Storage)
            - 1 Persistent Volume (Wordpress) (File Storage)
        - 1 ConfigMap
        - 1 Secret
        - 1 Ingress Controller
        - 1 Ingress
        - 1 Load Balancer
        - Service Account
        - Role
        - Role Binding

    - Virtual Node
        - 1 Pod (Nginx) with 3 replicas
        - 1 Service (Nginx)
        - 1 Ingress Controller
        - 1 Ingress
        - Sidecar Logging Agent

    - self-managed node
        - Cloud-init Script
        - 1 Pod (Nginx) with 3 replicas
        - kubernetes Dashboard
        - Service Account
        - Role
        - Role Binding
        - Instance Metadata Service (IMDS) fro Node Metadata
        - Load Balancer
        - Kubernetes Cluster Autoscaler
        - Kubernetes Metrics Server
        - Kubernetes Horizontal Pod Autoscaler
        - Kubernetes Vertical Pod Autoscaler

- Oracle Cloud Infrastructure Registry (OCIR)
    - Scaning Service
    - Vulnerability Report
    - Vulnerability Details
    - Image Signing

- Devops Services
    - DevOps Project
    - Git Repository GitHub
    - Build Pipeline
        - Managed Build Stage
        - Deliver Artifacts Stage
    - Deploy Pipeline
    - Artifact Registry
    - Container Registry

- Block Volume
- File Storage
- Capacity Reservations
- Instance Metadata Service (IMDS) fro Node Metadata