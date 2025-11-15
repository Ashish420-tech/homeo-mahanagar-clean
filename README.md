# Homeo Mahanagar – Flask Web App (Dockerized & Deployed on AWS EC2)

**Author:** *Ashish Mondal*  
**Role Demonstrated:** System Administrator • AWS Cloud • Linux • Docker • Python • Deployment & Automation

## 📌 Project Overview
This is a **Python Flask-based web application** packaged using **Docker** and deployed on an **AWS EC2 Ubuntu server**.
It demonstrates real-world **System Administrator + Cloud + DevOps skills**.

## 🏗 Architecture Diagram
User → Internet → AWS EC2 → Docker → Flask App  
(Optional: S3 backup + IAM role)

## 🚀 Features
- Flask backend  
- Docker containerized  
- AWS EC2 deployment  
- Backup automation  
- Optional IaC + CI/CD  

## ⚙️ Local Setup
git clone https://github.com/Ashish420-tech/homeo-mahanagar-clean.git
cd homeo-mahanagar-clean
docker build -t homeo-mahanagar:latest .
docker run -d -p 5000:5000 homeo-mahanagar:latest

## ☁️ AWS Deployment
1. Launch EC2 (Ubuntu 20.04)
2. Install Docker  
3. Transfer project  
4. Build & run container  

## 🔄 Backup (Optional)
Cron + S3 backup script example.

## 🏗 Infrastructure as Code (Optional)
Terraform sample in `infra/terraform/main.tf`.

## 🔁 CI/CD (Optional)
GitHub Actions sample included.

## 📂 Structure
- app.py  
- Dockerfile  
- templates/  
- scripts/  
- infra/terraform/  

## 👤 Author
Ashish Mondal  
System Administrator | AWS | Linux | Docker | Python
