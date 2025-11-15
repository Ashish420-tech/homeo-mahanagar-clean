# Homeo Mahanagar – Flask App Deployment on AWS (Dockerized)

**Author:** Ashish Mondal  
**Role Demonstrated:** System Administrator • Cloud (AWS) • Docker • Linux • Deployment Automation • Scripting

---

## 📌 Project Overview

This project is a **Dockerized Flask web application** deployed on **AWS EC2 (Ubuntu Linux)**.  
It demonstrates real-world System Administrator & DevOps skills, including:

- Linux server setup and configuration  
- Docker container build & deployment  
- AWS EC2 hosting with security groups  
- Python backend with Flask  
- Backup automation (S3)  
- Infra as Code (Terraform – optional)  
- GitHub Actions CI/CD (optional sample workflow)  
- Production-ready deployment steps  

This project is used as part of my portfolio to showcase **System Administrator + Cloud + Automation** capabilities.


---

## 🏗 Architecture Diagram (Simple Overview)
User → Internet → AWS EC2 Security Group (Port 5000) → Ubuntu EC2 Instance
→ Docker Engine → Flask App Container
→ Optional: S3 for backup, CloudWatch logs, IAM role


(You can upload an `architecture.png` in the repo and embed it here.)

---

## 🚀 Features

- CRUD-based Python/Flask web application  
- Packaged into a Docker container for easy deployment  
- Fully runnable on any Linux server or cloud VM  
- AWS deployment steps included  
- Backup script to S3 for disaster recovery  
- Optional automation using Terraform & GitHub Actions  

---

# 🔧 Local Setup (Run on your machine)

### **1. Clone this repo:**
```bash
git clone https://github.com/Ashish420-tech/homeo-mahanagar-clean.git
cd homeo-mahanagar-clean

2. Build Docker image:
docker build -t homeo-mahanagar:latest .

3. Run container:
docker run -d -p 5000:5000 homeo-mahanagar:latest

Open the app:
http://localhost:5000

☁️ AWS Deployment (EC2 – Ubuntu)
Step 1 → Launch EC2 Instance

OS: Ubuntu 20.04 LTS

Type: t2.micro (Free-tier)

Security Group Rules

5000/tcp – allow public access

22/tcp – your IP only (SSH)

Step 2 → Install Docker on EC2
sudo apt update -y
sudo apt install docker.io -y
sudo systemctl enable --now docker

Step 3 → Copy project files to EC2
scp -i /path/key.pem -r ./homeo-mahanagar-clean ubuntu@<EC2_PUBLIC_IP>:/home/ubuntu/

Step 4 → Build & Run Docker Container
cd homeo-mahanagar-clean
docker build -t homeo-mahanagar:latest .
docker run -d -p 5000:5000 homeo-mahanagar:latest

Access your app at:
http://<EC2_PUBLIC_IP>:5000

🔄 Backup & Disaster Recovery (Optional)
Backup script location:

scripts/backup_to_s3.py

This script uploads app data/logs to S3.

Example cron job for daily backup:
0 2 * * * /usr/bin/python3 /home/ubuntu/homeo-mahanagar-clean/scripts/backup_to_s3.py >> /var/log/homeo_backup.log 2>&1

IAM Role needed for EC2:

s3:PutObject

s3:ListBucket

🏗 Infrastructure-as-Code (Optional)

A minimal Terraform sample is provided in:

infra/terraform/main.tf


This automates:

EC2 instance creation

Security Group creation

Installing Docker via user_data

You can expand this to full multi-tier architecture.

⚙️ CI/CD (GitHub Actions)

Sample workflow included:

.github/workflows/deploy.yml


This pipeline can:

Build Docker image

Save/transfer to EC2

Restart container automatically

📁 Project Structure
homeo-mahanagar-clean/
│── app.py
│── Dockerfile
│── requirements.txt
│── templates/
│── static/
│── scripts/
│     └── backup_to_s3.py
│── infra/
│     └── terraform/
│             └── main.tf
└── README.md

🎯 System Administrator Skills Demonstrated

This project demonstrates:

Linux Administration

Package installation

Services

Permissions

Cron jobs

Logs

Cloud (AWS)

EC2 instance management

Security groups

IAM roles

S3 backup

Docker

Image building

Exposing ports

Container lifecycle

Networking

Ports & firewall

Public IP routing

SG rules

Python + Flask

Web app basics

Routing & templates

Automation

Backup script

Terraform (IaC)

GitHub Actions workflow

👤 Author

Ashish Mondal
System Administrator | Cloud | Linux | Windows | Python
