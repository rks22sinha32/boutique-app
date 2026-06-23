# boutique-app
# 🚀 End-to-End GitOps CI/CD Pipeline on AWS EKS

![Architecture Diagram](./Gitops_Project.jpg) ## 📋 Project Overview
This project demonstrates a fully automated, production-ready infrastructure and deployment pipeline for a microservices-based application (Boutique App). It leverages the **GitOps methodology** to ensure the Kubernetes cluster state is always synchronized with the Git repository, providing an auditable, secure, and resilient environment.

## 🛠️ Tech Stack
* **Cloud Provider:** AWS (VPC, Subnets, IGW, NAT, Route 53, ACM, ALB)
* **Infrastructure as Code (IaC):** Terraform
* **Container Orchestration:** Kubernetes (Amazon EKS)
* **Continuous Integration (CI):** GitHub Actions, Trivy, GHCR
* **Continuous Delivery (CD):** ArgoCD
* **Observability:** Prometheus, Grafana, ElasticSearch, Slack

---

## 🏗️ Architecture Breakdown

### 1. AWS Infrastructure (Terraform)
* Provisioned a custom VPC with Public and Private Subnets across 2 Availability Zones.
* Kept the EKS Node Groups inside the **Private Subnet** for strict security.
* Setup NAT Gateways for outbound internet access and an Internet Gateway for ingress traffic.
* Maintained the Terraform `.tfstate` remotely in an Amazon S3 bucket.

### 2. Continuous Integration (CI)
* Created automated workflows using **GitHub Actions**.
* Triggered on every code push: Checks out code, builds Docker images, runs security vulnerability scans using **Trivy**, and pushes secure images to **GitHub Container Registry (GHCR)**.

### 3. Continuous Delivery (CD)
* Installed **ArgoCD** inside the EKS cluster.
* Configured ArgoCD to continuously monitor the repository for any changes in the Kubernetes manifests (`.yaml` files).
* Automatically syncs and deploys the microservices (Boutique App) without manual intervention.

### 4. Traffic Management & Security
* Configured **AWS Load Balancer Controller (LBC)** to automatically provision an Application Load Balancer (ALB).
* Mapped the ALB endpoint to a custom domain using **Amazon Route 53**.
* Secured internet traffic with HTTPS using **AWS Certificate Manager (ACM)**.

### 5. Observability & Alerting
* **Monitoring:** Deployed Prometheus and Grafana for real-time tracking of cluster metrics.
* **Logging:** Configured the Elastic Stack (ECK) to aggregate application and cluster logs.
* **Alerting:** Integrated Slack webhooks to instantly notify the team of any critical alerts or pipeline failures.

---

## 👨‍💻 Key Learnings
* Mastering VPC Networking: Deep understanding of Public vs. Private Subnets and routing.
* Overcoming Terraform state conflicts with dynamically provisioned Kubernetes resources (like untracked ENIs and ALBs).
* Integrating AWS IAM Roles for Service Accounts (IRSA) for fine-grained pod-level security.
