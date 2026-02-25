# 🚀 DevOps Automation Pipeline

An end-to-end **DevOps CI/CD Automation Project** that demonstrates how to provision infrastructure, build Docker images, and deploy applications automatically on AWS using **Terraform, Ansible, Jenkins, Docker, Docker Compose, Watchtower, and GitHub Webhooks**.

---

## 📌 Project Overview

This project automates the complete lifecycle of a containerized web application:

- Infrastructure provisioning on AWS using Terraform
- Configuration management with Ansible
- CI/CD pipeline using Jenkins
- Docker image build and push to Docker Hub
- Automatic container updates using Watchtower
- Deployment on AWS EC2 with Docker Compose
- Zero manual intervention after initial setup

---

## 🧱 Architecture


GitHub (Code Push)
      |
      v
Jenkins (CI Pipeline)
      |
      v
Docker Image Build & Push
      |
      v
Docker Hub
     |
     v
Watchtower (Auto Pull)
      |
      v
Docker Compose (EC2)
      |
      v
Browser (Port 80)


---

## 📁 Project Structure


devops-automation-pipeline/
│
├── terraform/
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
│
├── ansible/
│ ├── inventory.ini
│ └── docker-setup.yml
│
├── docker/
│ ├── Dockerfile
│ └── docker-compose.yml
│
├── app/
│ └── index.html
│
├── Jenkinsfile
└── README.md


---

## ⚙️ Technologies Used

- **AWS EC2**
- **Terraform**
- **Ansible**
- **Docker**
- **Docker Compose**
- **Watchtower**
- **Jenkins**
- **GitHub Webhooks**
- **Nginx**

---

## 🚀 CI/CD Workflow

1. Developer pushes code to the `main` branch on GitHub
2. GitHub Webhook triggers Jenkins automatically
3. Jenkins:
   - Pulls the code
   - Builds Docker image
   - Pushes image to Docker Hub
4. Watchtower detects new image
5. Docker Compose restarts the container automatically
6. Updated application is live on EC2 (Port 80)

---

## 🖥️ Deployment Details

- Application runs inside a Docker container using **Nginx**
- Container is managed by **Docker Compose**
- **Restart policy enabled** to auto-start after reboot
- **Elastic IP** used to avoid webhook failures after EC2 restart

---

## 🔁 EC2 Stop / Start Behavior

| Action | Result |
|------|------|
| EC2 Reboot | Containers auto-start |
| EC2 Stop | Containers stop |
| EC2 Start | Containers auto-start via Docker Compose |
| GitHub Push | Auto rebuild & redeploy |

> Docker containers are configured with restart policies (`restart: always`) to ensure high availability.

---

## 🔐 Security Group Configuration

Inbound rules:
- **Port 22** – SSH
- **Port 80** – HTTP
- **Port 8080** – Jenkins

---

## 📦 Docker Compose Configuration

```yaml
version: "3.8"

services:
  app:
    image: sahilghidode/devops-automation-pipeline:latest
    container_name: devops-app
    ports:
      - "80:80"
    restart: always

  watchtower:
    image: containrrr/watchtower
    container_name: watchtower
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    command: --interval 300
    restart: always
🧠 Key Learnings

Infrastructure as Code using Terraform

Automated configuration using Ansible

CI/CD automation with Jenkins

Docker image lifecycle management

Zero-downtime deployment using Watchtower

Handling EC2 restart and IP changes using Elastic IP

🧪 How to Access the Application
http://<ELASTIC-IP>
🏁 Conclusion

This project demonstrates a production-style DevOps automation pipeline where infrastructure provisioning, application build, deployment, and updates are fully automated with minimal manual intervention.

👨‍💻 Author

BY Sahil Ghidode
DevOps & Cloud Enthusiast 🚀
