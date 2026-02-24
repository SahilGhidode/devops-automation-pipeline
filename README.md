# 🚀 DevOps Automation Pipeline (CI/CD on AWS)

This project demonstrates a complete **DevOps automation pipeline** using modern DevOps tools.  
It covers **infrastructure provisioning, configuration management, containerization, CI, and deployment** on AWS EC2.

---

## 📌 Project Overview

The goal of this project is to automate the complete lifecycle of an application:

- Provision infrastructure using **Terraform**
- Configure servers using **Ansible**
- Containerize the application using **Docker**
- Automate build and image push using **Jenkins**
- Integrate **GitHub Webhooks** for CI
- Deploy the application on **AWS EC2**
- Serve the application using **Nginx**

---

## 🛠️ Tools & Technologies Used

- **AWS EC2** – Cloud compute
- **Terraform** – Infrastructure as Code (IaC)
- **Ansible** – Configuration Management
- **Docker** – Containerization
- **Docker Hub** – Image registry
- **Jenkins** – CI/CD automation
- **GitHub** – Source code management
- **Nginx** – Web server

---

## 🏗️ Project Architecture


Developer
|
| (git push)
v
GitHub Repository
|
| (Webhook Trigger)
v
Jenkins Pipeline
|
|-- Build Docker Image
|-- Push Image to Docker Hub
v
AWS EC2 Instance
|
|-- Pull Docker Image
|-- Run Container (Nginx)
v
User accesses application via Public IP


---

## 📂 Repository Structure


devops-automation-pipeline/
├── app/
│ └── index.html # Web application
├── terraform/
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
├── ansible/
│ ├── inventory.ini
│ └── docker-setup.yml
├── Dockerfile
├── Jenkinsfile
├── docker-compose.yml
└── README.md


---

## 🚀 Implementation Steps

### 1️⃣ Infrastructure Provisioning (Terraform)
- EC2 instance created
- Security Group configured (Ports: 22, 80, 8080)
- Docker installed using `user_data`

```bash
terraform init
terraform apply
2️⃣ Configuration Management (Ansible)

Installed Docker on EC2

Pulled Docker image

Verified connectivity using Ansible ping

ansible -i inventory.ini ec2 -m ping
3️⃣ Containerization (Docker)

Nginx used as base image

Application files copied to /usr/share/nginx/html

Image built using Dockerfile

FROM nginx:latest
COPY app/ /usr/share/nginx/html/
4️⃣ CI Pipeline (Jenkins)

Jenkins installed on EC2

Jenkinsfile configured for:

Code checkout

Docker image build

Docker Hub login

Docker image push

docker build -t sahilghidode/devops-automation-pipeline:latest .
docker push sahilghidode/devops-automation-pipeline:latest
5️⃣ GitHub Webhook Integration

Webhook configured in GitHub

Every push to main branch automatically triggers Jenkins build

6️⃣ Deployment on EC2

Docker image pulled from Docker Hub

Container run on port 80

docker pull sahilghidode/devops-automation-pipeline:latest
docker run -d --name devops-app -p 80:80 sahilghidode/devops-automation-pipeline:latest
🌐 Access the Application
http://<EC2_PUBLIC_IP>
🔄 Automation Behavior
What is Automatic?

GitHub push triggers Jenkins automatically

Docker image rebuilds automatically

Image is pushed to Docker Hub automatically

What is Manual?

Deployment (container restart) is manual

This project currently follows:

CI (Continuous Integration) + Manual Deployment

🛑 What Happens If EC2 is STOPPED?

When the EC2 instance is stopped:

Server shuts down

Docker containers stop

Jenkins stops

Website becomes unavailable

▶️ Steps After EC2 STOP → START
1️⃣ Start EC2 instance (AWS Console)

Note new public IP (IP may change)

2️⃣ SSH into EC2
ssh -i devops-automation-pipeline.pem ubuntu@<NEW_PUBLIC_IP>
3️⃣ Start Docker service (if not running)
sudo systemctl start docker
4️⃣ Start application container
docker start devops-app
5️⃣ Start Jenkins
sudo systemctl start jenkins
6️⃣ Verify Application
http://<NEW_PUBLIC_IP>
🧠 Interview Explanation

“This project implements an end-to-end DevOps automation pipeline using Terraform, Ansible, Docker, Jenkins, and GitHub. Jenkins handles CI automatically, while deployment is triggered manually on the EC2 instance.”

🔮 Future Enhancements

Fully automated CD using Jenkins SSH deploy

Watchtower for auto container updates

Elastic IP for static public IP

HTTPS with SSL (Nginx + Certbot)

Monitoring using Prometheus & Grafana

✅ Project Status

✔ Infrastructure as Code
✔ CI Pipeline with Jenkins
✔ GitHub Webhook Integration
✔ Dockerized Deployment on AWS
✔ Production-ready DevOps workflow

👨‍💻 Author

By Sahil Ghidode
DevOps | Cloud | Automation
