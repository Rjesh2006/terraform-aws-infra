# 🚀 Terraform AWS Infrastructure Automation

This repository contains a **modular and well-structured Terraform project** designed for automating AWS infrastructure deployment. It follows Infrastructure as Code (IaC) best practices, enabling scalable, manageable, and repeatable cloud resource provisioning. 🌩️

## 📂 Project Overview

The repository is organized into multiple directories and configuration files to promote code reuse, maintainability, and clarity:

- **`modules/`**  
  🔧 Contains custom reusable Terraform modules, including:  
  - `bucket-dynamodb.tf` — S3 buckets and DynamoDB table provisioning  
  - `ec2.tf` — EC2 instance definitions, including setup for Nginx testing  
  - `s3.tf` — Additional S3 resource configurations  
  - `terraform.tf` — Module-specific Terraform setup files  
  - `variables.tf` — Input variables specific to modules  
  - Also includes **RDS configuration** for relational database provisioning and management.

- **`aws/`**  
  ☁️ AWS-specific configurations, such as `bucket.tf` for provisioning S3 buckets.

- **`EKS/`**  
  🐝 (Optional) Configuration files for provisioning and managing an Amazon EKS cluster.

- **`local_state/`**  
  📁 Local backend state configuration (if used).

- **`install_nginx.sh`**  
  🖥️ Shell script to automate Nginx installation on EC2 instances during provisioning (used for testing server setup).

- **Core Terraform files:**  
  - `main.tf` — 🛠️ Primary resource definitions  
  - `variables.tf` — 🎛️ Input variables for flexible configuration  
  - `outputs.tf` — 📤 Output values for referencing deployed resources  
  - `providers_region.tf` — 🌍 AWS provider and region setup  

- **Terraform Remote Backend:**  
  🗃️ Terraform state is stored remotely in an **S3 backend**, enabling centralized, secure, and collaborative state management.

- **SSH Keys:**  
  - 🔐 `local-terra-key` (excluded from version control for security) for SSH access to EC2 instances.

## ✨ Key Features

- **Modular Design:** Facilitates reuse of infrastructure components and easy scaling. 📦  
- **Custom Modules:** Includes bucket, DynamoDB, EC2 (with Nginx testing), S3, and RDS modules for a full-stack AWS setup. 🏗️  
- **Terraform Remote State:** Centralized state management using S3 backend for collaboration and safety. 🗃️  
- **Infrastructure as Code:** Automate cloud provisioning with declarative Terraform scripts. 📜  
- **Best Practices:** Clear directory structure and separation of concerns. 🧹  
- **Extendable:** Supports AWS services from basic S3 buckets to complex EKS clusters and RDS instances. 🌐  
- **Automation:** Includes scripts for configuration management like Nginx setup on EC2 for testing deployments. 🤖  

---
