# Weather API Deployment on AWS EKS

---

## 📉 Project Overview

This repository contains a complete project that:

- 👉 Develops a Python FastAPI application to provide weather data for Dhaka.
- 👉 Containerizes the app using Docker.
- 👉 Manages Kubernetes resources (Deployment, Service, Ingress).
- 👉 Provisions AWS EKS Cluster and associated resources via Terraform.
- 👉 Automates CI/CD deployment pipeline using Jenkins.

The goal is to achieve a **fully automated, production-grade cloud-native deployment** of the Weather API application.

---

## 📂 Project Structure

```plaintext
.
├── app/                      # FastAPI source code
│   └── main.py
├── k8s-manifests/            # Kubernetes YAML manifests
│   ├── configmap.yaml
│   ├── deployment.yaml
│   ├── ingress.yaml
│   ├── secret.yaml.example
│   └── service.yaml
├── terraform/                # Infrastructure as Code (Terraform)
│   ├── backend.tf
│   ├── main.tf
│   ├── outputs.tf
│   ├── providers.tf
│   ├── terraform.tfvars.example
│   ├── variables.tf
│   └── modules/
│       ├── eks/
│       ├── iam/
│       └── vpc/
├── Dockerfile                # Dockerfile for building FastAPI app image
├── Jenkinsfile               # Jenkins pipeline for CI/CD automation
├── docker-compose.yaml       # Local development setup (optional)
├── requirements.txt          # Python dependencies
├── .gitignore                # Git ignore rules
└── README.md                 # Project documentation (this file)
```

---

## 🚀 Features

- 🔍 **Real-time Weather Data:** Fetches temperature data for Dhaka from OpenWeatherMap.
- 🌍 **Containerized:** Docker image optimized for performance and security.
- 🛠️ **Infrastructure as Code:** EKS, IAM Roles, VPC fully managed via Terraform modules.
- 🛠️ **Helm-based NGINX Ingress Controller:** Clean URL routing without exposing container ports.
- 🔄 **CI/CD Pipeline:** Automated build, push, and deploy triggered on Git operations via Jenkins.
- 🔥 **Zero Downtime Deployment:** Using Kubernetes rolling updates.

---

## 🔍 Quick Start Guide

### 1. Deploy with Docker

```bash
git clone https://github.com/BrainStation23HR/Devops_Masud.git
cd 
docker build -t weather-api-img .
docker run -it -d -p 8000:8000 --name weather-api-cont weather-api-img
```

### 2. Provision Infrastructure (EKS Cluster)

```bash
cd terraform
terraform init
terraform plan
terraform apply
```

### 3. Deploy Application to Kubernetes

```bash
cd k8s-manifests/
kubctl apply -f configmap.yaml
kubctl apply -f secret.yaml
kubctl apply -f deployment.yaml
kubectl apply -f service.yaml
```
---

## 🌐 Author

**Masud Parvaze**\
DevOps & Cloud Enthusiast 👩‍🚀

---


