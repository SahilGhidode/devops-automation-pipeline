# End-to-End DevOps Automation Pipeline

## 📌 Project Overview
This project demonstrates a complete DevOps automation workflow using Terraform, Ansible, Docker, Docker Compose, Jenkins, and GitHub.

The pipeline automates:
- Infrastructure provisioning on AWS
- Server configuration using Ansible
- Containerization using Docker
- CI/CD using Jenkins
- Automated deployment on AWS EC2

On every push to the `main` branch, the application is built, containerized, pushed to Docker Hub, and deployed automatically.

---

## 🛠️ Tools & Technologies Used
- AWS EC2
- Terraform (Infrastructure as Code)
- Ansible (Configuration Management)
- Docker & Docker Compose
- Jenkins (CI/CD)
- GitHub (Source Control)
- Docker Hub (Image Registry)

---

## 🏗️ Project Architecture
GitHub → Jenkins → Docker Build → Docker Hub → EC2 → Live Application

---

## 📂 Project Structure

devops-automation-pipeline/
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
├── jenkins/
│ └── Jenkinsfile
│
├── app/
│ └── index.html
│
└── README.md


---

## 🚀 Task Breakdown

### Task 1: Infrastructure Provisioning (Terraform)
- Launch AWS EC2 instance
- Open ports 22 (SSH) and 80 (HTTP)
- Install Docker using user_data

### Task 2: Configuration Management (Ansible)
- Install Docker
- Pull Docker image from Docker Hub
- Run container automatically

### Task 3: Container Orchestration (Docker Compose)
- Run nginx container for static website
- Optional Watchtower container for auto-updates

### Task 4: CI/CD Pipeline (Jenkins)
- Pull code from GitHub
- Build Docker image
- Push image to Docker Hub (instantprachi namespace)

### Task 5: Webhook Integration
- GitHub webhook triggers Jenkins job on every push to `main`

### Task 6: Deployment
- Application exposed on EC2 public IP via port 80 / 8080

---

## ▶️ How to Run Terraform
```bash
cd terraform
terraform init
terraform plan
terraform apply
📌 Output

After successful execution:

EC2 instance is created

Docker is installed automatically

Application is accessible via EC2 public IP

🔮 Future Improvements

Add HTTPS using Nginx + SSL

Use ECS or Kubernetes

Add monitoring with Prometheus & Grafana

Fully automate Ansible via Jenkins

👨‍💻 Author

Sahil Ghidode
DevOps Automation Project