# Part A: Develop & Deploy a REST API

---

## 📉 Project Overview (Weather API Deployment on AWS EKS)

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
cd Devops_Masud
docker build -t weather-api-img .
docker run -it -d -p 8000:8000 --name weather-api-cont weather-api-img
```
OR Use Docker compose file 

```bash
# Ensure the .env file is in the root directory
docker-compose --env-file .env up -d
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
kubctl apply -f ingress.yaml
```
---

# Part B: System Architecture Design

![cloud architecture diagram](https://github.com/user-attachments/assets/23ec8119-bdf6-46c9-bf3e-68122f25e28a)

Scalable System Architecture for E-Commerce Platforms
Overview
This architecture diagram represents a scalable, cloud-based web application designed to handle user requests efficiently while ensuring performance, reliability, and maintainability. The system leverages AWS services and follows best practices for microservices, caching, and background processing.
Components and Design
1. User Interaction Layer

Global User: End users access the application via the internet.
CDN (Content Delivery Network): Serves static assets (e.g., HTML, CSS, JS) to users with low latency by caching content at edge locations.
Load Balancer: Distributes incoming traffic across multiple instances of the web application to ensure high availability and prevent overload.
Web Application Firewall (WAF): Protects the application from common web exploits (e.g., SQL injection, XSS) by filtering malicious traffic.

2. API Gateway

Acts as a single entry point for all API requests (Read API and Write API), decoupling clients from the underlying microservices and worker services. Handles request routing, authentication, rate limiting, and API versioning.

3. Microservice
A stateless service that handles business logic for read-heavy operations. Being stateless allows for easy horizontal scaling by adding more instances without concern for shared session data. Interacts with the in-memory cache (e.g., Redis) to fetch frequently accessed data quickly.

4. Database Layer

RDS (Relational Database Service): A managed database service with a primary instance for writes and read replicas for scaling read operations.
Read Replicas: Handle read requests to offload the primary database, improving performance for read-heavy workloads.
In-Memory Cache (e.g., Redis): Stores frequently accessed data to reduce database load and improve response times.

5. Worker Service (Background Jobs)

Processes write-heavy or time-consuming tasks asynchronously (e.g., data processing, file uploads).
Receives write requests via the API Gateway and processes them in the background.
Interacts with the primary RDS instance for write operations and object storage for file persistence.

6. Storage

Object Storage (e.g., S3): Stores unstructured data like files, images, or backups with high durability and scalability.
Used by both the microservice and worker service for storing and retrieving large objects.

7. Monitoring and Logging

Performance Monitoring (e.g., AWS CloudWatch): Tracks system metrics (e.g., latency, error rates) and API Gateway performance.
Centralized Logging: Collects logs from all components (microservice, worker service, object storage) for debugging and auditing.

Reasoning Behind the Design

Scalability: The use of a load balancer, read replicas, and microservices allows the system to scale horizontally by adding more instances as traffic increases.
Performance: CDN and in-memory caching reduce latency for users, while read replicas offload the primary database for read-heavy workloads.
Reliability: The API Gateway and load balancer ensure high availability, and the worker service decouples write operations to prevent bottlenecks.
Security: The WAF protects against common threats, and centralized logging helps with monitoring and incident response.
Cost Efficiency: Using managed services like RDS, object storage, and API Gateway reduces operational overhead while providing scalability.

Conclusion
This architecture balances performance, scalability, and reliability for a modern web application. It leverages AWS services to minimize maintenance while ensuring the system can handle varying loads efficiently.


## 🌐 Author

**Masud Parvaze**\
DevOps Engineer

---
