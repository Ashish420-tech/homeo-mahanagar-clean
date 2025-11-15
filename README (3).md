# Homeo Mahanagar – Flask Web App (Dockerized & Deployed on AWS EC2)

**Author:** *Ashish Mondal*  
**Role Demonstrated:** System Administrator • AWS Cloud • Linux • Docker • Python • Deployment & Automation

---

## 📌 Project Overview
This is a **Python Flask-based web application** packaged using **Docker** and deployed on an **AWS EC2 Ubuntu server**.  
This project demonstrates real-world **System Administrator + Cloud + DevOps skills**, including:

- Linux server setup & administration  
- Docker installation, image build & container deployment  
- AWS EC2 hosting, security groups & firewall rules  
- Python-based backend (Flask)  
- Deployment automation (optional IaC + CI workflows)  
- Backup & Disaster Recovery approach (S3 + cron examples)

This repo serves as part of my professional portfolio to showcase my capabilities as a **System Administrator / Cloud Infrastructure Engineer**.

---

## 🏗 Architecture Diagram (Simple View)

```
User → Internet → AWS Security Group (Port 5000)  
         → Ubuntu EC2 Instance  
               → Docker Engine  
                     → Flask Application (Container)
Optional:
         → S3 Backup (via Backup Script)
         → IAM Role for EC2
```

---

## 🚀 Features

- Python + Flask web application  
- Dockerized for consistent deployment  
- AWS EC2 (Ubuntu Linux) cloud deployment  
- Backup automation script included  
- Production-ready deployment instructions  
- Can be expanded into CI/CD or Terraform Infra-as-Code  

---

# ⚙️ Local Setup (Run on your machine)

### **1. Clone this repository**
```bash
git clone https://github.com/Ashish420-tech/homeo-mahanagar-clean.git
cd homeo-mahanagar-clean
```

### **2. Build the Docker image**
```bash
docker build -t homeo-mahanagar:latest .
```

### **3. Run the container**
```bash
docker run -d -p 5000:5000 homeo-mahanagar:latest
```

### Open the application:
```
http://localhost:5000
```

---

# ☁️ AWS Deployment Guide (EC2 – Ubuntu)

### **Step 1 — Launch AWS EC2 Instance**
- Ubuntu 20.04 LTS  
- Instance type: t2.micro  
- Security Group (Firewall rules):
  - TCP 5000 → Allow (app access)
  - TCP 22 → Allow only your IP (SSH)

---

### **Step 2 — Install Docker on EC2**
```bash
sudo apt update -y
sudo apt install docker.io -y
sudo systemctl enable --now docker
```

---

### **Step 3 — Upload project to EC2**
```bash
scp -i key.pem -r ./homeo-mahanagar-clean ubuntu@<EC2_PUBLIC_IP>:/home/ubuntu/
```

---

### **Step 4 — Build & run Docker container**
```bash
cd homeo-mahanagar-clean
docker build -t homeo-mahanagar:latest .
docker run -d -p 5000:5000 homeo-mahanagar:latest
```

### App URL
```
http://<EC2_PUBLIC_IP>:5000
```

---

# 🔄 Backup & Disaster Recovery (Optional)

A backup script can be used to upload logs/data to Amazon S3.

### **Example cron job (runs daily at 2 AM):**
```bash
0 2 * * * /usr/bin/python3 /home/ubuntu/homeo-mahanagar-clean/scripts/backup_to_s3.py >> /var/log/homeo_backup.log 2>&1
```

### Required IAM permissions:
- `s3:PutObject`
- `s3:ListBucket`

---

# 🏗 Infrastructure-as-Code (Optional)

A minimal Terraform configuration can automate:

- EC2 creation  
- Security group creation  
- Docker installation using user_data  
- Assigning IAM role  

Location:  
```
infra/terraform/main.tf
```

---

# 🔁 CI/CD Pipeline (Optional)

A sample GitHub Actions workflow may:

- Build Docker image  
- Export/save image  
- SCP to EC2  
- Restart Docker container  

Location:
```
.github/workflows/deploy.yml
```

---

# 📂 Project Structure

```
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
│           └── main.tf
└── README.md
```

---

# 🎯 Skills Demonstrated in This Project

### **Linux Administration**
- Package management  
- Service configuration  
- Cron jobs  
- File permissions  

### **Cloud (AWS)**
- EC2 provisioning  
- Security Groups  
- IAM roles  
- S3 storage  

### **Docker**
- Dockerfile creation  
- Building images  
- Running containers  

### **Networking**
- Firewall / SG rules  
- Port mapping  
- Public IP access  

### **Python & Flask**
- Routing  
- Backend logic  
- Dynamic templates  

### **Automation**
- Backup scripts  
- Optional Terraform  
- Optional GitHub Actions  

---

# 👤 Author

**Ashish Mondal**  
System Administrator | AWS | Linux | Windows Server | Docker | Python Scripting  
GitHub: https://github.com/Ashish420-tech  
LinkedIn: *(Add your LinkedIn URL here)*

---

# ⭐ Support  
If you like this project, please ⭐ star the repository!  
Contributions & suggestions are welcome.
