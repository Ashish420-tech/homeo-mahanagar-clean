# Homeo Mahanagar Project

## Project Overview
This is a Python-based web application for managing Homeo Mahanagar products. The app is Dockerized and deployed on AWS EC2 for easy access and scalability.

## Features
- CRUD operations for homeopathy products
- Dockerized application for seamless deployment
- Ready for AWS EC2 deployment

## Technology Stack
- Python 3.x
- Flask
- Docker
- AWS EC2
- Git & GitHub

---

## Project Structure
```
homeo-mahanagar/
├── app.py
├── requirements.txt
├── Dockerfile
├── README.md
└── templates/
    └── index.html
```

---

## Setup Instructions

### 1. Clone the Repository
```bash
git clone https://github.com/your-username/homeo-mahanagar.git
cd homeo-mahanagar
```

### 2. Python Environment Setup (Optional)
```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

### 3. Build Docker Image
```bash
docker build -t homeo-mahanagar:latest .
```
**Dockerfile content:**
```
# Use official Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy requirements and install
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY . ./

# Expose port and run app
EXPOSE 5000
CMD ["python", "app.py"]
```

### 4. Run Docker Container
```bash
docker run -d -p 5000:5000 homeo-mahanagar:latest
```

### 5. Access Application
- Open browser at: [http://localhost:5000](http://localhost:5000)

---

## AWS Deployment Instructions

### 1. Launch EC2 Instance
- Launch an Ubuntu EC2 instance on AWS.
- Update packages:
```bash
sudo apt update && sudo apt upgrade -y
```
- Install Docker:
```bash
sudo apt install docker.io -y
sudo systemctl enable docker
sudo systemctl start docker
```

### 2. Transfer Project to EC2
```bash
scp -i /path/to/your-key.pem -r ./homeo-mahanagar ubuntu@<EC2_PUBLIC_IP>:/home/ubuntu/
```

### 3. Build & Run Docker on EC2
```bash
cd /home/ubuntu/homeo-mahanagar
docker build -t homeo-mahanagar:latest .
docker run -d -p 5000:5000 homeo-mahanagar:latest
```

### 4. Access Application on EC2
Open browser: `http://<EC2_PUBLIC_IP>:5000`

---

## app.py Example
```python
from flask import Flask, render_template
app = Flask(__name__)

@app.route('/')
def home():
    return render_template('index.html')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
```

---

## Troubleshooting

### Docker Build Issues
- **Common Issue:** Missing dependencies in Dockerfile
- **Solution:** Ensure `requirements.txt` has all Python packages:
```bash
pip install -r requirements.txt
```

### Container Not Running
- Check running containers:
```bash
docker ps
```
- View container logs:
```bash
docker logs <container_id>
```
- Stop container if needed:
```bash
docker stop <container_id>
```

### Stopping & Removing Containers
```bash
docker stop <container_id>
docker rm <container_id>
```

### Terminate EC2 Instance
- Log in to AWS Management Console → EC2 → Select Instance → Terminate

---

## Deployment Notes
- AWS EC2 instance used: t2.micro (free tier)
- Steps followed: Docker build → Docker run → Port 5000 open in Security Group → Test app
- Optional: Configure Nginx or reverse proxy for production

---

## GitHub Instructions

### 1. Add & Commit Changes
```bash
git add .
git commit -m "Initial commit with full project and documentation"
```

### 2. Push to GitHub
```bash
git push origin main
```

---

## Author
- Ashish Mondal
- GitHub: [https://github.com/your-username](https://github.com/your-username)

